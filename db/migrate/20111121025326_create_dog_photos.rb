class CreateDogPhotos < ActiveRecord::Migration
  def self.up
    create_table :dog_photos do |t|
      t.integer :dog_id
      t.string :url
      t.string :size
      t.boolean :active
      t.timestamps
    end
    add_index :dog_photos, :dog_id
  end

  def self.down
    drop_table :dog_photos
  end
end
