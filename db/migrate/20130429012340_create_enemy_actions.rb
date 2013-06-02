class CreateEnemyActions < ActiveRecord::Migration
  def change
    create_table :enemy_actions do |t|

      t.integer :enemy_id
      t.integer :damage
      t.integer :acceleration
      t.integer :distance

      t.timestamps
    end
  end
end
