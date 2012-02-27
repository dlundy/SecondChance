class AddPrivateFieldsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :private_email, :boolean, :default => false
    add_column :members, :private_phone, :boolean, :default => false
    add_column :members, :private_address_1, :boolean, :default => false
  end

  def self.down
    remove_column :members, :private_email
    remove_column :members, :private_phone
    remove_column :members, :private_address_1
  end
end
