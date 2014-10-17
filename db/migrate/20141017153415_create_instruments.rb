class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :model
      t.decimal :price
      t.string :img_url
      t.string :status
      t.text :description
      t.string :availibility

      t.timestamps
    end
  end
end
