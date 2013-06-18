class DropEnemyActionsTable < ActiveRecord::Migration
  def up
    drop_table :enemy_actions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
