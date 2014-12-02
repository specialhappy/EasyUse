class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :model
      t.decimal :price
      t.decimal :fee_per_hour
      t.string :img_url
      t.text :description
      t.string :status

      t.belongs_to :user
      t.belongs_to :institution
      
      t.timestamps
    end
  end
end
