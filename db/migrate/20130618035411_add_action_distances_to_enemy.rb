class AddActionDistancesToEnemy < ActiveRecord::Migration
  def change
    add_column :enemies, :action_distances, :string
  end
end
