class AddRescueGroupsKeyToDogPhotos < ActiveRecord::Migration
  def self.up
    add_column :dog_photos, :rescue_groups_key, :string
  end

  def self.down
    remove_column :dog_photos, :rescue_groups_key
  end
end
