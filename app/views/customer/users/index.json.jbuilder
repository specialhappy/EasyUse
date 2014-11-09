json.array!(@users) do |user|
  json.extract! user, :id, :card_number, :name, :password, :sex, :id_number, :phone, :picture, :email, :address, :login_number, :last_login_time, :status
  json.url user_url(user, format: :json)
end
