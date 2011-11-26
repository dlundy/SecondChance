class RenameColorsToColorInDogsTable < ActiveRecord::Migration
  def self.up
    rename_column :dogs, :colors, :color
  end

  def self.down
    rename_column :dogs, :color, :colors
  end
end
