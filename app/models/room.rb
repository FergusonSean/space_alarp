class Room < ActiveRecord::Base
  attr_accessible :level, :power, :sector_id
  
  belongs_to :sector
  
  def push_button(letter)
    letter == 'A' ? push_a_button : push_b_button
  end
  
  def find_target
    sector.enemies.sort_by(&:distance).select{|enemy| !enemy.dead?}.first
  end
  
  def push_a_button
    if upper?
      if sector.lower_room.power > 0
        if sector.red?
          find_target.damage!(4)
          sector.use_power!(1)
        elsif sector.white?
          find_target.damage! 5
          sector.use_power! 1          
        else
          find_target.damage! 4
          sector.use_power! 1
        end
        return true
      else
        return false
      end
      
    else
      if sector.red?
        find_target.damage! 2
        return true
      elsif sector.white?
        if power > 0
          targets = sector.ship.sectors.map{|s| s.find_target }
          targets.select{|t| t.distance < 8}.each do |target|
            target.damage! 1   
          end
          sector.use_power! 1
          return true
        else
          return false
        end
      else
        find_target.damage! 2
        return true
      end
    end
  end
  
  def push_b_button
    
  end
  
  def location
    "#{upper? ? 'Upper': 'Lower'} #{sector.color.titlecase} Sector"
  end
  
  def upper?
    level == 2
  end
end
