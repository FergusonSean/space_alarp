class Enemy < ActiveRecord::Base
  attr_protected
  has_many :enemy_actions
  belongs_to :sector
  accepts_nested_attributes_for :enemy_actions
  
  def damage!(amount)
    self.current_shield_strength -= amount
    
    if(current_shield_strength < 0)
      self.health += current_shield_strength
      self.current_shield_strength = 0
      
      self.health += current_shield_strength
    end
    
    self.save!
  end
  
  def alive?
    health > 0
  end
  
  def move!
    time_passed = (Time.now - (self.last_moved_on.present? ? self.last_moved_on : self.created_at))
    new_distance = self.distance - self.speed * time_passed / 60
    return if self.distance - new_distance < 1
      
    
    triggered_actions = self.enemy_actions.where(:distance => [new_distance...self.distance])
    self.distance = new_distance
    self.save!
    triggered_actions.each(&:trigger!)
  end
end
