class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|

      t.timestamps
    end
  end
end
