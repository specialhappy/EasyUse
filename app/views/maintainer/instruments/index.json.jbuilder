json.array!(@maintainer_instruments) do |maintainer_instrument|
  json.extract! maintainer_instrument, :id, :name, :model, :price, :fee_per_hour, :img_url, :description, :status, :user_id, :institution_id
  json.url maintainer_instrument_url(maintainer_instrument, format: :json)
end
