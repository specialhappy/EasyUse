json.array!(@instruments) do |instrument|
  json.extract! instrument, :id, :name, :model, :price, :img_url, :status, :description, :availibility
  json.url instrument_url(instrument, format: :json)
end
