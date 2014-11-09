json.array!(@groups) do |group|
  json.extract! group, :id, :name, :description, :create_time, :status
  json.url group_url(group, format: :json)
end
