json.array!(@region_centers) do |region_center|
  json.extract! region_center, :id
  json.url region_center_url(region_center, format: :json)
end
