json.array!(@b_level_tags) do |b_level_tag|
  json.extract! b_level_tag, :id
  json.url b_level_tag_url(b_level_tag, format: :json)
end
