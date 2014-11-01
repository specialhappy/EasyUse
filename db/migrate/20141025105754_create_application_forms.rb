class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.text :experiment_description

      t.timestamps
    end
  end
end
