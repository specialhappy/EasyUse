class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :model
      t.decimal :price
      t.string :img_url
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
