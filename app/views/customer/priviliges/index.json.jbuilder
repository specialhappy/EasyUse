json.array!(@priviliges) do |privilige|
  json.extract! privilige, :id
  json.url privilige_url(privilige, format: :json)
end
