class AddAwakeTimeToAwakes < ActiveRecord::Migration
  def change
    add_column :awakes, :awake_time, :datetime
  end
end
