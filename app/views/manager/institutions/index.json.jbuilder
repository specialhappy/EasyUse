json.array!(@manager_institutions) do |manager_institution|
  json.extract! manager_institution, :id, :name, :description, :url, :region_center_id
  json.url manager_institution_url(manager_institution, format: :json)
end
