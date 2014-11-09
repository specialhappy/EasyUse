json.array!(@operation_logs) do |operation_log|
  json.extract! operation_log, :id
  json.url operation_log_url(operation_log, format: :json)
end
