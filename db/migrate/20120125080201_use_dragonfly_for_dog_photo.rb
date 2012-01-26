# Remove size column
# change url to source_url
class UseDragonflyForDogPhoto < ActiveRecord::Migration
  def self.up
    change_table :dog_photos do |t|
      t.remove :size, :active, :url
      t.string :image_uid
    end
  end

  def self.down
    change_table :dog_photos do |t|
      t.string :size
      t.string :url
      t.boolean :active
      t.remove :image_uid
    end
  end
end
