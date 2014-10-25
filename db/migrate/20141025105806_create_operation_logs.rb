class CreateOperationLogs < ActiveRecord::Migration
  def change
    create_table :operation_logs do |t|

      t.timestamps
    end
  end
end
