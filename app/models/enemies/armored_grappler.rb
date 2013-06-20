class Enemies::ArmoredGrappler < Enemy

  def initialize(arguments = {}, options = {})
    super({
            :speed => 2,
            :max_shield_strength => 3,
            :health => 4
          }.merge(arguments), {}.merge(options))
  end


  def enemy_action_x
    sector.damage! 1
  end

  def enemy_action_y
    self.health += 1
  end

  def enemy_action_z
    sector.damage! 4
  end
end
