class AddOrderToDogPhotos < ActiveRecord::Migration
  def self.up
    add_column :dog_photos, :ordinal, :integer
  end

  def self.down
    remove_column :dog_photos, :ordinal
  end
end
