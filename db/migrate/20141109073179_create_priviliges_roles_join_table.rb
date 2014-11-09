class CreatePriviligesRolesJoinTable < ActiveRecord::Migration
  def change
    create_table :priviliges_roles, id: false do |t|
      t.integer :role_id
      t.integer :privilige_id
    end
  end
end