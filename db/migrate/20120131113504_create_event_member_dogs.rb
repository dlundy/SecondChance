class CreateEventMemberDogs < ActiveRecord::Migration
  def self.up
    create_table :event_member_dogs do |t|
      t.integer :event_member_id
      t.integer :dog_id
      t.timestamps
    end
    add_index :event_member_dogs, :event_member_id
  end

  def self.down
    drop_table :event_member_dogs
  end
end
