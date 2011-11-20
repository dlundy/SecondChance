class CreateRescueGroupsPulls < ActiveRecord::Migration
  def self.up
    create_table :rescue_groups_pulls do |t|
      t.string :status
      t.integer :dog_count
      t.integer :updates

      t.timestamps
    end
  end

  def self.down
    drop_table :rescue_groups_pulls
  end
end
