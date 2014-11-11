class Customer::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  layout 'customerlayout'
  # GET /appointments
  # GET /appointments.json
  def index
    #@appointments = Appointment.all
    @appointments = User.find(session[:user_id]).appointments
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @instrument = Instrument.find(params[:id])
    @user = User.find(session[:user_id])
    @groups = @user.groups
  end

  # GET /appointments/1/edit
  def edit
  end

  def appointment_success

  end

  # POST /appointments
  # POST /appointments.json
  def create
    @user = User.find(session[:user_id])
    #    @appointment = Appointment.new(:start_time => appointment_params[:start_time],:end_time =>appointment_params[:end_time],:price_paid => appointment_params[:price_paid],:fee =>appointment_params[:fee],:submit_time => Time.now,:status => appointment_params[:status],:user_id => @user.id,:instrument_id => instrument_id_params[:instrument_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.price_paid=appointment_params[:price_paid]
    @appointment.fee=appointment_params[:fee]
    @appointment.submit_time=Time.now
    @appointment.status=appointment_params[:status]
    @appointment.user_id=@user.id
    @appointment.instrument_id=instrument_id_params[:instrument_id]
    @appointment.group_id=group_id_params[:group_id]
    info= @appointment.save ? 'success':'fail'
    @application_form = @appointment.create_application_form(experiment_description_params)

    redirect_to '/customer/appointments/appointment_success'
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
  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :price_paid, :fee, :status)
  end

  def instrument_id_params
    params.require(:appointment).permit(:instrument_id)
  end

  def experiment_description_params
    params.require(:appointment).permit(:experiment_description)
  end
  
  def group_id_params
    params.require(:Group).permit(:group_id)
  end

end
