json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :start_time, :end_time, :price_paid, :fee, :submit_time, :status
  json.url appointment_url(appointment, format: :json)
end
