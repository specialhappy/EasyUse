class CreateALevelTags < ActiveRecord::Migration
  def change
    create_table :a_level_tags do |t|

      t.timestamps
    end
  end
end
