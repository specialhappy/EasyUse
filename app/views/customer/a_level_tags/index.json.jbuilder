json.array!(@a_level_tags) do |a_level_tag|
  json.extract! a_level_tag, :id, :name, :description
  json.url a_level_tag_url(a_level_tag, format: :json)
end
