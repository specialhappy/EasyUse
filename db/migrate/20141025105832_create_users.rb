class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :card_number
      t.string :name
      t.string :password
      t.string :sex
      t.string :id_number
      t.string :phone
      t.string :picture
      t.string :email
      t.string :address
      t.integer :login_number
      t.datetime :last_login_time
      t.string :status

      t.timestamps
    end
  end
end
