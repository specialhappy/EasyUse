class CreateRegionCenters < ActiveRecord::Migration
  def change
    create_table :region_centers do |t|

      t.timestamps
    end
  end
end
