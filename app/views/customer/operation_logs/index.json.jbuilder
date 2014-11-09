json.array!(@operation_logs) do |operation_log|
  json.extract! operation_log, :id, :start_time, :end_time
  json.url operation_log_url(operation_log, format: :json)
end
