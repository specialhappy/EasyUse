json.array!(@maintainer_appointments) do |maintainer_appointment|
  json.extract! maintainer_appointment, :id, :date, :time, :price_paid, :fee, :submit_time, :status, :user_id, :group_id, :instrument_id
  json.url maintainer_appointment_url(maintainer_appointment, format: :json)
end
