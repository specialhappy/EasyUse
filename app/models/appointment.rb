class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :instrument
  has_one :application_form
  
  def format_time(appointment)
    
  end
  
  def get_appointments_by_user_id(user_id)
    time_group = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"]
    @appointments = User.find(user_id).appointments.order("created_at desc")
    @appointments.each do |appointment|
      time = appointment.time
      start_index = time[6,2].to_i
      end_index = time[-4,2].to_i
      start_time = time_group[start_index-1]
      end_time = time_group[end_index]
      appointment.time = start_time+" -- "+end_time
    end
    return @appointments
  end
  
  def get_appointment_by_id(id)
    time_group = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"]
    @appointment=Appointment.find(id)
    time = @appointment.time
    start_index = time[6,2].to_i
    end_index = time[-4,2].to_i
    start_time = time_group[start_index-1]
    end_time = time_group[end_index]
    @appointment.time = start_time+" -- "+end_time
    return @appointment
  end
end
