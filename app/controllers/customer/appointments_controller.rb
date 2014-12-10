class Customer::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  layout 'customerlayout'
  protect_from_forgery :only => :index
  # GET /appointments
  # GET /appointments.json
  def index
    #@appointments = Appointment.all
    time_group = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"]
    @appointments = User.find(session[:user_id]).appointments.order("created_at desc")
    @appointments.each do |appointment|
      time = appointment.time
      start_index = time[6,2].to_i
      end_index = time[-4,2].to_i
      start_time = time_group[start_index-1]
      end_time = time_group[end_index]
      appointment.time = start_time+" -- "+end_time
    #appointment.time = start_index.to_s + end_index.to_s
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment=Appointment.find(params[:id])
    @instrument=Instrument.find(@appointment[:instrument_id])
    @application_form=@appointment.application_form
    group=Group.find(@appointment[:group_id])
    @payer=User.find(group.create_user_id)
@metas=@application_form.application_form_metas

  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @instrument = Instrument.find(params[:id])
    begin
      @user = User.find(session[:user_id])
      @groups = @user.groups
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

    @appointment.fee=fee_interface(@appointment)
    if verify(session[:user_id])
      @appointment.status='审核通过'
      @appointment.status='未开始'
    end
    @appointment.save 
    
    @application_form = @appointment.create_application_form(application_form_params)
    
        number=params[:number].to_i
      number.times do |i|
        j=i+1
        string_key="key"+j.to_s
        string_value="content"+j.to_s
        @meta=ApplicationFormMeta.new(:key=>params[string_key],:value=>params[string_value])
        @application_form.application_form_metas << @meta
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
    params.require(:Group).permit(:group_id)
  end


  def verify(user_id)
    return true
  end

  def fee_interface(appointment)
    return 2;
  end
end
