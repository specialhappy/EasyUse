json.array!(@manager_region_centers) do |manager_region_center|
  json.extract! manager_region_center, :id, :name, :description, :url
  json.url manager_region_center_url(manager_region_center, format: :json)
end
