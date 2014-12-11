class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :instrument
  has_one :application_form

  def format_todate
    time = Time.now
    time.strftime("YYYY-MM-DD")
    return time
  end

  def get_appointments_by_instrument_id(id)
    @appointments = Instrument.first.appointments.where("date>=?",format_todate).order(date: :asc, time: :asc)
    time_group = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"]
    @appointments_f = []
    @appointments.each do |appointment|
      time = appointment.time
      start_index = time[6,2].to_i
      end_index = time[-4,2].to_i
      start_time = time_group[start_index-1]
      end_time = time_group[end_index]
      appointment.time = start_time+" -- "+end_time
      
      now_time = Time.now
      format_time=now_time.strftime("hh:mm")
      if appointment.date==format_todate
        if end_time>format_time
          @appointments_f << appointment
        end
      else
        @appointments_f << appointment
      end
    end
    return @appointments_f
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
  
  def get_appointments_not_pay_by_user_id(id)
    time_group = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"]
    @groups = Group.where("create_user_id=?",id)
    @appointments = []
    @groups.each do |group|
      @appointments2 = Appointment.where("group_id=?",group.id)
      @appointments2.each do |appointment2|
        time = appointment2.time
        start_index = time[6,2].to_i
        end_index = time[-4,2].to_i
        start_time = time_group[start_index-1]
        end_time = time_group[end_index]
        appointment2.time = start_time+" -- "+end_time
        @appointments << appointment2
      end
    end
    return @appointments
  end
  
end
