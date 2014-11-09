class CreateWorkingRecords < ActiveRecord::Migration
  def change
    create_table :working_records do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :content

      t.belongs_to :operation_log
      t.timestamps
    end
  end
end
