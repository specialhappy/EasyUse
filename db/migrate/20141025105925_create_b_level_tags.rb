class CreateBLevelTags < ActiveRecord::Migration
  def change
    create_table :b_level_tags do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
