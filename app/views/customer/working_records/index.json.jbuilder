json.array!(@working_records) do |working_record|
  json.extract! working_record, :id
  json.url working_record_url(working_record, format: :json)
end
