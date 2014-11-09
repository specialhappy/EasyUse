class CreateOperationLogs < ActiveRecord::Migration
  def change
    create_table :operation_logs do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.belongs_to :appointment
      t.timestamps
    end
  end
end
