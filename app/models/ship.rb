class Ship < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :sectors
  
  def self.build_ship(params = {})
    ship = Ship.new
    
    ship.sectors << [Sector.new_section("blue"), Sector.new_section("white"), Sector.new_section("red")]    
    ship.save!
    
    ship
  end
end
