class AddMemberIdToDogs < ActiveRecord::Migration
  def self.up
    add_column :dogs, :member_id, :integer
    add_index :dogs, :member_id
  end
  

  def self.down
    remove_column :dogs, :member_id
  end
end
