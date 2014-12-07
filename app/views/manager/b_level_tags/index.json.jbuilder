json.array!(@manager_b_level_tags) do |manager_b_level_tag|
  json.extract! manager_b_level_tag, :id, :name, :description, :a_level_tag_id
  json.url manager_b_level_tag_url(manager_b_level_tag, format: :json)
end
