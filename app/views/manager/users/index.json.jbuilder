json.array!(@manager_users) do |manager_user|
  json.extract! manager_user, :id, :card_number, :name, :password, :sex, :id_number, :phone, :picture, :email, :address, :status, :default_group_id, :institution_id
  json.url manager_user_url(manager_user, format: :json)
end
