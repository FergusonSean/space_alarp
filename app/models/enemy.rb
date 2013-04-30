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
  
  def dead?
    health > 0
  end
end
