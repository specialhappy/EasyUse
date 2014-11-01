class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.datetime :create_time
      t.string :status

      t.timestamps
    end
  end
end
