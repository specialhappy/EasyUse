class CreateApplicationFiles < ActiveRecord::Migration
  def change
    create_table :application_files do |t|
      t.string :name
      t.string :url

      t.belongs_to :application_form
      t.timestamps
    end
  end
end
