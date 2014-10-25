class CreateWorkingRecords < ActiveRecord::Migration
  def change
    create_table :working_records do |t|

      t.timestamps
    end
  end
end
