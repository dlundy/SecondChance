class CreateLabels < ActiveRecord::Migration

  def self.up
    create_table :labels do |t|
      t.string :name
      t.string :hex_code
      t.string :type
      t.boolean :active
      t.integer :position

      t.timestamps
    end

    add_index :labels, :id

    load(Rails.root.join('db', 'seeds', 'labels.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "labels"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/labels"})
    end

    drop_table :labels
  end

end
