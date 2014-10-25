json.array!(@time_periods) do |time_period|
  json.extract! time_period, :id
  json.url time_period_url(time_period, format: :json)
end
