class Enemies::Destroyer < Enemy

  def initialize(arguments = {}, options = {})
    super({
            :speed => 2,
            :max_shield_strength => 2,
            :health => 5
          }.merge(arguments), {}.merge(options))
  end

  def enemy_action_x
    sector.damage! 1, :double_damage_through_shields => true
  end

  def enemy_action_y
    sector.damage! 2, :double_damage_through_shields => true
  end

  def enemy_action_z
    sector.damage! 2, :double_damage_through_shields => true
  end
end
