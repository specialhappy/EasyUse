json.array!(@time_periods) do |time_period|
  json.extract! time_period, :id, :name, :start_time, :end_time
  json.url time_period_url(time_period, format: :json)
end
