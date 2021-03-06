class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :time
      t.string :price_paid
      t.decimal :fee
      t.datetime :submit_time
      t.string :status

      t.belongs_to :user
      t.belongs_to :group
      t.belongs_to :instrument
      t.timestamps
    end
  end
end
