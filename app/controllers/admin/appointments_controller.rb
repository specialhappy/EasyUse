class Admin::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
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
        @appointment = Appointment.new(:start_time => params[:start_time].to_s,:end_time => params[:end_time].to_s,:price_paid => params[:price_paid].to_s,:fee => params[:fee],:submit_time => params[:submit_time].to_s,:status => params[:status].to_s,:user_id => params[:user_id].to_s,:group_id => params[:group_id],:instrument_id => params[:instrument_id])
    info = @appointment.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/appointments/1/modify
  def modify
    begin
        appointment = Appointment.find(params[:id])
       # appointment.start_time = params[:start_time].to_s
     #   appointment.end_time = params[:end_time].to_s
        appointment.price_paid = params[:price_paid].to_s
        appointment.fee = params[:fee]
      #  appointment.submit_time = params[:submit_time].to_s
        appointment.status = params[:status].to_s
        appointment.user_id = params[:user_id].to_s
        appointment.group_id = params[:group_id].to_s
        appointment.instrument_id = params[:instrument_id].to_s
        info = appointment.save ? 'success' : '更新失败'
      rescue ActiveRecord::RecordNotFound
        logger.error '更新不存在的数据'
        info = '不存在的数据'
      rescue Exception => e
        logger.error e.to_s
        info = "更新异常"
      end
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
      params[:appointment]
    end
end
