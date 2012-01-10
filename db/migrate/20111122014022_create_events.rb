class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :lat
      t.decimal :lng
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email
      t.string :website
      t.integer :position

      t.timestamps
    end

    add_index :events, :id

    load(Rails.root.join('db', 'seeds', 'events.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "events"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/events"})
    end

    drop_table :events
  end

end
