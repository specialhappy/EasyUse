class CreateWorkingRecords < ActiveRecord::Migration
  def change
    create_table :working_records do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :content

      t.timestamps
    end
  end
end
