class Customer::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  layout 'customerlayout'
  protect_from_forgery :only => :index
  # GET /appointments
  # GET /appointments.json
  def index
    @appointment = Appointment.new
    @appointments = @appointment.get_appointments_by_user_id(session[:user_id])
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.new
    @appointment = @appointment.get_appointment_by_id(params[:id])

    @instrument=Instrument.find(@appointment[:instrument_id])
    @application_form=@appointment.application_form
    group_id=@appointment[:group_id]
    group=Group.find(@appointment[:group_id])
    @payer=User.find(group.create_user_id)
    @metas=@application_form.application_form_metas
    @file=@application_form.application_file

  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @instrument = Instrument.find(params[:id])
    @users = User.all
    begin
      @user = User.find(session[:user_id])
      @groups = @user.groups
      
      @groups.each do |group|
        group.description = User.find(group.create_user_id).name
      end
      
      if @user.default_group_id ==nil
        @name=""
      else
        defaultGroup=Group.find(@user.default_group_id)
        @name=User.find(defaultGroup.create_user_id).name
      end
    rescue Exception => e
      redirect_to '/welcome/login'
    end

  end

  # GET /appointments/1/edit
  def edit
  end

  def get_time
    time=""
    swap=""
    date = params[:date]
    @appointments=Appointment.where("date = ?", params[:date])
    @appointments.each do |appointment|
      swap = appointment.time.to_s
      swap = swap.delete("{" "}")
      swap = swap+","
      time =time + swap
    end
    time = "{"+time.chop+"}"
    render :json => time
  end

  def appointment_success
    @appointment_id = params[:appointment_id]
  end

  def appointment_finish
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.status="已结束"
    @appointment.save
    redirect_to '/terminal/index'
  end
  
  def appointment_start
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.status="进行中"
    @appointment.save
    redirect_to '/terminal/index'
  end
  # POST /appointments
  # POST /appointments.json
  def create
    @user = User.find(session[:user_id])
    #    @appointment = Appointment.new(:start_time => appointment_params[:start_time],:end_time =>appointment_params[:end_time],:price_paid => appointment_params[:price_paid],:fee =>appointment_params[:fee],:submit_time => Time.now,:status => appointment_params[:status],:user_id => @user.id,:instrument_id => instrument_id_params[:instrument_id])
    @appointment = Appointment.new
    @appointment.date = params[:date]
    @appointment.time = appointment_time_params.to_json
    @appointment.price_paid='未付款'
    @appointment.submit_time=Time.now
    @appointment.status='待审核'
    @appointment.user_id=@user.id
    @appointment.instrument_id=instrument_id_params[:instrument_id]
    if group_id_params[:group_id]==""
    @appointment.group_id=@user.default_group_id
    else
      @appointment.group_id=group_id_params[:group_id]
    end

    @appointment.fee=params[:fee]
    if verify(session[:user_id])
      @appointment.status='审核通过'
      @appointment.status='未开始'
    end
    @appointment.save
    #保存application_form
    @application_form = @appointment.create_application_form(application_form_params)
    #保存application_form_meta
    number=params[:number].to_i
    number.times do |i|
      j=i+1
      string_key="key"+j.to_s
      string_value="content"+j.to_s
      @meta=ApplicationFormMeta.new(:key=>params[string_key],:value=>params[string_value])
      @application_form.application_form_metas << @meta
    end
    #保存application_files
    uploaded_io = url_param[:url]
    if uploaded_io !=nil
      save_name=getFileName(uploaded_io)
      File.open(Rails.root.join('public', 'files', save_name), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @file=ApplicationFile.new(:name=>uploaded_io.original_filename, :url=>save_name)
    @application_form.application_file=@file
    end

    redirect_to '/customer/appointments/appointment_success?appointment_id='+@appointment.id.to_s

  #respond_to do |format|
  #  if @appointment.save
  #    format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
  #    format.json { render :show, status: :created, location: @appointment }
  #  else
  #    format.html { render :new }
  #    format.json { render json: @appointment.errors, status: :unprocessable_entity }
  #  end
  #end
  #render :json => @application_form
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_price
    time=params[:time].to_i
    instrument=Instrument.find(params[:instrument_id])
    fee_per_hour=instrument.fee_per_hour
    price = fee_per_hour*time/2
    #str="{'price':'"+price.to_s+"'}"
    render :text => price.to_s
  end
  
  def payments
    @appointment = Appointment.new
    @appointments = @appointment.get_appointments_not_pay_by_user_id(session[:user_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # useless
  def appointment_params
    params.require(:appointment).permit(:date)
  end

  def appointment_time_params
    params.permit(:time01, :time02, :time03, :time04, :time05, :time06, :time07, :time08, :time09, :time10, :time11, :time12, :time13, :time14, :time15, :time16, :time17, :time18)
  end

  def instrument_id_params
    params.require(:appointment).permit(:instrument_id)
  end

  def application_form_params
    params.require(:appointment).permit(:experiment_description, :experiment_name, :experiment_purpose, :related_project, :experiment_sample, :experiment_operator)
  end

  def group_id_params
    params.require(:group).permit(:group_id)
  end

  def url_param
    params.require(:appointment).permit(:url)
  end

  def verify(user_id)
    return false
  end

  def getFileName(uploaded_io)
    if uploaded_io.nil? == false
      strs=uploaded_io.original_filename.split(".")
      time=Time.new.to_s
      if strs.length==1
        fileName=time
      else
        fileName=time+'.'+strs[1]
      end
    return fileName
    end
  end

end
