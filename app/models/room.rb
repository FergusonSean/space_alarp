class Room < ActiveRecord::Base
  attr_accessible :level, :power, :sector_id
  
  belongs_to :sector
  
  def push_button(letter)
    letter == 'A' ? push_a_button : push_b_button
  end
  
  def push_a_button
    if upper?
      if sector.lower_room.power > 0
        if sector.red?
          puts sector.enemies
          target = sector.enemies.sort_by(&:distance).first
          puts "Target is #{target.nil? ? "nil" : "not nil"}"
          target.damage!(4)
          sector.use_power!(1)
        elsif sector.white?
          target = sector.enemies.sort_by(&:distance).first
          target.damage! 5
          sector.use_power! 1          
        else
          target = sector.enemies.sort_by(&:distance).first
          target.damage! 4
          sector.use_power! 1
        end
        return true
      else
        return false
      end
      
    else
      if sector.red?
        target = sector.enemies.sort_by(&:distance).first
        target.health -= 2
        target.save!
        return true
      elsif sector.white?
        targets = sector.ship.sectors.map{|s| s.enemies.sort_by(&:distance).first }
        targets.select{|t| t.distance < 8}.each do |target|
          target.damage! 1   
        end
        sector.use_power! 1
        return true
      else
        target = sector.enemies.sort_by(&:distance).first
        target.health -= 2
        target.save!
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
