class Room < ActiveRecord::Base
  attr_protected
  
  belongs_to :sector
  
  def push_button(letter)
    letter == 'A' ? push_a_button : push_b_button
  end
  
  def find_target
    sector.enemies.sort_by(&:distance).select{|enemy| enemy.alive?}.first
  end
  
  def fire_laser(power, cost = 1)
    find_target.damage!(power) if find_target.present?
    sector.use_power!(cost)
  end
  
  def push_a_button
    if upper?
      if sector.lower_room.power > 0
        if sector.red?
          fire_laser 4
        elsif sector.white?
          fire_laser 5          
        else
          fire_laser 4
        end
        return true
      else
        return false
      end
      
    else
      if sector.red?
        fire_laser 2, 0
        return true
      elsif sector.white?
        if power > 0
          targets = sector.ship.sectors.map{|s| s.lower_room.find_target}.compact
          targets.select{|t| t.distance < 8}.each do |target|
            target.damage! 1   
          end
          sector.use_power! 1
          return true
        else
          return false
        end
      else
        fire_laser 2, 0
        return true
      end
    end
  end
  
  def power_shield!
    pull_power_from(self.sector.lower_room)
  end
  
  def pull_power_from(room)
    power_to_pull = [self.maximum_power - self.power, room.power].min
    self.power += power_to_pull
    self.save!
    room.power -= power_to_pull
    room.save
  end
  
  def pull_power!
    pull_power_from(sector.ship.white_sector.lower_room)
  end
  
  def generate_power!
    self.power = self.maximum_power if ordinance > 0
    self.ordinance -= 1
    self.save
  end
  
  def push_b_button
    if upper?
      power_shield!
    else
      if sector.white?
        generate_power!
      else
        pull_power!
      end
    end
    
  end
  
  def location
    "#{upper? ? 'Upper': 'Lower'} #{sector.color.titlecase} Sector"
  end
  
  def upper?
    level == 2
  end
end
