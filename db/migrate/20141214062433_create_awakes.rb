class CreateAwakes < ActiveRecord::Migration
  def change
    create_table :awakes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
