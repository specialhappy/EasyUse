json.array!(@manager_a_level_tags) do |manager_a_level_tag|
  json.extract! manager_a_level_tag, :id, :name, :description
  json.url manager_a_level_tag_url(manager_a_level_tag, format: :json)
end
