class Sector < ActiveRecord::Base
  attr_accessible :color
  
  has_many :rooms
  
  belongs_to :ship
  
  def self.new_section(color)
    section = Sector.new(:color => color)
    section.rooms = [Room.new({ :level => 2, :power => 1}), Room.new({ :level => 1, :power => (color == 'white' ? 3 : 2)})]
    
    section
  end
  
  def upper_room
    rooms.where(:level => 2).first
  end
  
  def lower_room
    rooms.where(:level => 1).first
  end
end
