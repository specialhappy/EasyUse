class CreateApplicationFormMeta < ActiveRecord::Migration
  def change
    create_table :application_form_meta do |t|
      t.string :key
      t.string :value

      t.belongs_to :application_form
      t.timestamps
    end
  end
end
