class CreatePriviliges < ActiveRecord::Migration
  def change
    create_table :priviliges do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
