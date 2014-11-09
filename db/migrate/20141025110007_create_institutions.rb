class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.text :description
      t.string :url

      t.belongs_to :regionCenter
      t.timestamps
    end
  end
end
