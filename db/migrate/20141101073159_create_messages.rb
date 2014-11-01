class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from
      t.text :content
      t.datetime :send_time

      t.timestamps
    end
  end
end
