json.array!(@instruments) do |instrument|
  json.extract! instrument, :id, :name, :model, :price, :img_url, :description, :status
  json.url instrument_url(instrument, format: :json)
end
