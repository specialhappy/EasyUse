class CreateCheckRules < ActiveRecord::Migration
  def change
    create_table :check_rules do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
