class CreateAwakes < ActiveRecord::Migration
  def change
    create_table :awakes do |t|
      t.integer :sleep_cycle_id
      t.datetime :wake_time

      t.timestamps
    end
  end
end
