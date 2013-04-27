class AddDamageToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :damage, :integer, :default => 0
  end
end
