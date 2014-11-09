class CreateALevelTags < ActiveRecord::Migration
  def change
    create_table :a_level_tags do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
