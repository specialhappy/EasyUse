class Admin::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/appointments
  # GET /admin/appointments.json
  def index
  end

  #GET /admin/appointments/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    appointments=Appointment.order("id").limit(limit).offset(start)
    count=Appointment.count :all
   render :text =>get_json(count,appointments.to_json)
  end
  
    # POST /appointments
  # POST /appointments.json
  def create
        @appointment = Appointment.new(appointment_params)
        @appointment.submit_time=Time.now
        info = @appointment.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/appointments/1/modify
  def modify
      info = @appointment.update(appointment_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/appointments/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Appointment.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.permit(:start_time, :end_time, :price_paid, :fee, :status, :user_id, :instrument_id, :group_id)
    end
end
