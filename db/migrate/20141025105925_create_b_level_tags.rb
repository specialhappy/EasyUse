class CreateBLevelTags < ActiveRecord::Migration
  def change
    create_table :b_level_tags do |t|

      t.timestamps
    end
  end
end
