class Enemy < SpaceAlarpModel

  attr_accessor :enemy_actions, :sector, :name, :health, :current_shield_strength, :max_shield_strength, :speed, :distance, :last_moved_on

  accepts_nested_attributes_for :enemy_actions

  def damage!(amount)
    self.current_shield_strength -= amount

    if (current_shield_strength < 0)
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
    new_distance = self.distance - self.speed
    return if self.distance - new_distance < 1


    triggered_actions = self.enemy_actions.where(:distance => [new_distance...self.distance])
    self.distance = new_distance
    self.save!
    triggered_actions.each(&:trigger!)
  end
end
