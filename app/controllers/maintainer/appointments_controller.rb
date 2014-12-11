class Maintainer::AppointmentsController < ApplicationController
  before_action :set_maintainer_appointment, only: [:show, :edit, :update, :destroy, :check]
layout 'customerlayout'
  # GET /maintainer/appointments
  # GET /maintainer/appointments.json
  def index
    #仪器的所有人是当前用户->instrument->显示对应的预约。。。。。。。。。。。。。。。。。。。
      @user = User.find(session[:user_id])
     # userid=@user.id
      @instruments=@user.instruments
     #@instruments=Instrument.connection.select_all("select * from instruments where user_id= 1")
     @maintainer_appointments =[]
     @maintainer_appointment = Appointment.new
     @instruments.each do |instrument|
       @appointments=instrument.appointments
       @appointments.each do |appointment|
         if appointment.status=='待审核'
           appointment = @maintainer_appointment.get_appointment_by_id(appointment.id)
           @maintainer_appointments  << appointment
         else
           next
         end
   
         end
     end
    #render :json =>@maintainer_appointments 
  end

  # GET /maintainer/appointments/1
  # GET /maintainer/appointments/1.json
  def show
  end

  # GET /maintainer/appointments/new
  def new
    @maintainer_appointment = Appointment.new
  end

  # GET /maintainer/appointments/1/edit
  def edit
  end

  # POST /maintainer/appointments
  # POST /maintainer/appointments.json
  def create
    @maintainer_appointment = Appointment.new(maintainer_appointment_params)

    respond_to do |format|
      if @maintainer_appointment.save
        format.html { redirect_to [:maintainer, @maintainer_appointment], notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @maintainer_appointment }
      else
        format.html { render :new }
        format.json { render json: @maintainer_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintainer/appointments/1
  # PATCH/PUT /maintainer/appointments/1.json
  def update
    respond_to do |format|
      if @maintainer_appointment.update(maintainer_appointment_params)
        format.html { redirect_to [:maintainer, @maintainer_appointment], notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintainer_appointment }
      else
        format.html { render :edit }
        format.json { render json: @maintainer_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintainer/appointments/1
  # DELETE /maintainer/appointments/1.json
  def destroy
    @maintainer_appointment.destroy
    respond_to do |format|
      format.html { redirect_to maintainer_appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def check
    @maintainer_appointment.update(status: '审核通过')
    redirect_to maintainer_appointments_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintainer_appointment
      @maintainer_appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintainer_appointment_params
      params.require(:appointment).permit(:date, :time, :price_paid, :fee, :submit_time, :status, :user_id, :group_id, :instrument_id)
    end
end
