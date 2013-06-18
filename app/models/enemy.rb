class Enemy < ActiveRecord::Base
  attr_protected
  has_many :enemy_actions
  belongs_to :sector
  accepts_nested_attributes_for :enemy_actions
 
  def initialize(arguments = {}, options = {})
    super
    regen_shields
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

    triggered_actions = self.enemy_actions.where(:distance => [new_distance...self.distance])
    self.distance = new_distance
    self.save!
    triggered_actions.each(&:trigger!)
  end
end
