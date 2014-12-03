class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.string :experiment_name
      t.string :experiment_purpose
      t.string :related_project
      t.string :experiment_sample
      t.string :experiment_operator
      t.text :experiment_description
 
      t.belongs_to :appointment
      t.timestamps
    end
  end
end
