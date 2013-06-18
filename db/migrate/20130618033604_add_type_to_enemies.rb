class AddTypeToEnemies < ActiveRecord::Migration
  def change
    add_column :enemies, :type, :string
  end
end
