class AddImageColumnsToEventsAndMembers < ActiveRecord::Migration
  def self.up
    add_column :events, :main_image_uid, :string
    add_column :members, :profile_image_uid, :string
  end

  def self.down
    remove_column :events, :main_image_uid
    remove_column :members, :profile_image_uid
  end
end
