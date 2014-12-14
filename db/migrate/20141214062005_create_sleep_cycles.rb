class CreateSleepCycles < ActiveRecord::Migration
  def change
    create_table :sleep_cycles do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
