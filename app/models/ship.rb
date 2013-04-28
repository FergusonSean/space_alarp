class Ship < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :sectors
  
  def self.build_ship(params = {})
    ship = Ship.new
    
    ship.sectors << [Sector.new_section("blue"), Sector.new_section("white"), Sector.new_section("red")]    
    ship.save!
    
    ship
  end
  
  def start_mission!
    self.mission_start = DateTime.now
	  self.save!
  end

  def red_sector
    sectors.where(:color => 'red').first
  end
  
  def white_sector
    sectors.where(:color => 'white').first
  end
  
  def blue_sector
    sectors.where(:color => 'blue').first
  end
end
