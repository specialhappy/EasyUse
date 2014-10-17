class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.boolean :paid
      t.decimal :fee
      t.datetime :start_time
      t.datetime :end_time
      t.references :order, polymorphic: true

      t.timestamps
    end
  end
end
