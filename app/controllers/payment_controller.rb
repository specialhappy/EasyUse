class PaymentController < ApplicationController
  layout 'customerlayout'
  
  def pay
    @appointment_id = params[:appointment_id]
  end
  
  def pay_success
    @appointment = Appointment.find(params[:appointment_id])
    if pay_interface
      @appointment.price_paid='已付款'
      @appointment.save
    end
  end
end

private

def pay_interface
    return true
end