class CreateDogs < ActiveRecord::Migration

  def self.up
    create_table :dogs do |t|
      t.integer :rescue_groups_id
      t.string :title
      t.string :name
      t.string :breed
      t.string :sex
      t.decimal :weight
      t.string :weight_unit
      t.decimal :age
      t.string :colors
      t.text :description
      t.text :notes
      t.integer :primary_image_id
      t.integer :position
      t.boolean :active, :default => true
      t.timestamps
    end
    add_index :dogs, :id
    add_index :dogs, :rescue_groups_id
    add_index :dogs, :name
    add_index :dogs, :breed

    # load(Rails.root.join('db', 'seeds', 'dogs.rb'))
  end

  def self.down
    # regfinery stuff... but we are switching to using a plain model
    # if defined?(UserPlugin)
    #       UserPlugin.destroy_all({:name => "dogs"})
    #     end
    # 
    #     if defined?(Page)
    #       Page.delete_all({:link_url => "/dogs"})
    #     end

    drop_table :dogs
  end

end
