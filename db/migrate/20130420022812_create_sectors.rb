class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :color

      t.timestamps
    end

    rename_column :rooms, :sector, :sector_id
  end
end
