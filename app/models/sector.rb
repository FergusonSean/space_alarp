class Sector < ActiveRecord::Base
  attr_protected
  
  has_many :rooms
  has_many :enemies
  
  belongs_to :ship
  
  def self.new_section(color)
    section = Sector.new(:color => color)
    section.rooms = [
      Room.new({ 
                 :level => 2, 
                 :power => 1, 
                 :maximum_power => (color == 'white' ? 3 : 2)
               }), 
      Room.new({ 
                 :level => 1, 
                 :power => (color == 'white' ? 3 : 2),
                 :maximum_power => (color == 'white' ? 5 : 3), 
                 :ordinance => (color == 'white' ? 5 : 0),
               })
    ]
    
    section
  end
  
  def red?
    color == 'red'
  end

  def white?
    color == 'white'
  end

  def blue?
    color == 'blue'
  end
  
  def use_power!(amount)
    return if lower_room.power < amount
    lower_room.update_attributes! :power => lower_room.power - amount
  end
  
  def upper_room
    rooms.where(:level => 2).first
  end
  
  def lower_room
    rooms.where(:level => 1).first
  end
  
  def damage!(amount, options={})
    options = {
      :double_damage_through_shields => false
    }.merge options
    amount -= self.upper_room.power
    
    if amount > 0
      self.upper_room.update_attributes! :power => 0
      
      self.damage += amount
      self.damage += amount if options[:double_damage_through_shields]

      self.save!
    else
      self.upper_room.update_attributes! :power => -amount
    end
  end
end
