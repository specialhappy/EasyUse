class CreateRegionCenters < ActiveRecord::Migration
  def change
    create_table :region_centers do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
