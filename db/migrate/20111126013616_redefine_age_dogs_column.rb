class RedefineAgeDogsColumn < ActiveRecord::Migration
  def self.up
    change_column :dogs, :age, :string
  end

  def self.down
    change_column :dogs, :age, :decimal
  end
end
