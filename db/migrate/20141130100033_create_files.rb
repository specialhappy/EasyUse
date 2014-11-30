class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :name
      t.string :url

      t.belongs_to :application_form
      t.timestamps
    end
  end
end