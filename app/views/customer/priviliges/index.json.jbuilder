json.array!(@priviliges) do |privilige|
  json.extract! privilige, :id, :name, :description
  json.url privilige_url(privilige, format: :json)
end
