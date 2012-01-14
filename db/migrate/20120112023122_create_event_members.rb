class CreateEventMembers < ActiveRecord::Migration
  def self.up
    create_table :event_members do |t|
      t.integer :event_id
      t.integer :member_id
      t.string :invite_hash
      t.timestamps
    end
    add_index :event_members, :event_id
    add_index :event_members, :member_id
  end

  def self.down
    drop_table :event_members
  end
end
