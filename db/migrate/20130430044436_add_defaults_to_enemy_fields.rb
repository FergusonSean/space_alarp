class AddDefaultsToEnemyFields < ActiveRecord::Migration
  def up
    change_column :enemies, :health, :integer, :default => 0
    change_column :enemies, :current_shield_strength, :integer, :default => 0
    change_column :enemies, :max_shield_strength, :integer, :default => 0
    change_column :enemies, :speed, :integer, :default => 0
    change_column :enemies, :distance, :integer, :default => 0

    change_column :enemy_actions, :damage, :integer, :default => 0
    change_column :enemy_actions, :acceleration, :integer, :default => 0
    change_column :enemy_actions, :distance, :integer, :default => 0
  end

  def down

  end
end
