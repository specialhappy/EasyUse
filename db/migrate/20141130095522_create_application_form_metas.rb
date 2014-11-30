class CreateApplicationFormMetas < ActiveRecord::Migration
  def change
    create_table :application_form_metas do |t|
      t.string :key
      t.string :value

      t.belongs_to :application_form
      t.timestamps
    end
  end
end