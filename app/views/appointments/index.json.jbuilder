json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :paid, :fee, :start_time, :end_time, :user_id
  json.url appointment_url(appointment, format: :json)
end
