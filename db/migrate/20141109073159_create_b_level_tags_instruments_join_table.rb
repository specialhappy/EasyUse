class CreateBLevelTagsInstrumentsJoinTable < ActiveRecord::Migration
  def change
    create_table :b_level_tags_instruments, id: false do |t|
      t.integer :instrument_id
      t.integer :b_level_tag_id
    end
  end
end
