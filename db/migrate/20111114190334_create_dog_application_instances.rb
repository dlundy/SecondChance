class CreateDogApplicationInstances < ActiveRecord::Migration
  def self.up
    create_table :dog_application_instances do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone
      t.string :phone_2
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :dog_application_instances
  end
end
