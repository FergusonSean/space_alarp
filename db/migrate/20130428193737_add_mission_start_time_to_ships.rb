class AddMissionStartTimeToShips < ActiveRecord::Migration
  def up 
    add_column :ships, :mission_start, :datetime
  end

  def down 
    remove_column :ships, :mission_start 
  end
end
