class CreatePriviliges < ActiveRecord::Migration
  def change
    create_table :priviliges do |t|

      t.timestamps
    end
  end
end
