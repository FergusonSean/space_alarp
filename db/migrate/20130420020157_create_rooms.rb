class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :sector
      t.integer :level
      t.integer :power

      t.timestamps
    end
  end
end
