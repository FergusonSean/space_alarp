class Enemy < ActiveRecord::Base
  attr_protected
  belongs_to :sector
 
  def initialize(arguments = {}, options = {})
    super
    regen_shields
    name = self.class.name.titleize unless arguments.include? :name
  end

  def damage!(amount)
    self.current_shield_strength -= amount

    if current_shield_strength < 0
      self.health += self.current_shield_strength
      self.current_shield_strength = 0
    end
    
    self.save!
  end

  def regen_shields
    self.current_shield_strength = self.max_shield_strength
  end
  
  def alive?
    health > 0
  end
  
  def move!
    new_distance = self.distance - self.speed
    return if self.distance - new_distance < 1

    action_distances_array = action_distances.split(',').map(&:to_i)
    action_distances_array.each do |threshold|
      next unless threshold.between?(new_distance, self.distance-1)

      if threshold == action_distances.first
        enemy_action_x
      elsif threshold == action_distances.last
        enemy_action_z
      else
        enemy_action_y
      end
    end

    self.distance = new_distance
    self.save!
  end
end
