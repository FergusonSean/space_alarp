class CreateEnemies < ActiveRecord::Migration
  def change
    create_table :enemies do |t|
      t.integer :sector_id
      t.string :name
      t.integer :health
      t.integer :current_shield_strength
      t.integer :max_shield_strength
      t.integer :speed
      t.integer :distance

      t.timestamps
    end
  end
end
