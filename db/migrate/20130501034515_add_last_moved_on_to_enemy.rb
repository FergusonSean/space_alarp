class AddLastMovedOnToEnemy < ActiveRecord::Migration
  def change
    add_column :enemies, :last_moved_on, :datetime
  end
end
