class AddMaximumPowerToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :maximum_power, :integer, :default => 0
    add_column :rooms, :ordinance, :integer, :default => 0
  end
end
