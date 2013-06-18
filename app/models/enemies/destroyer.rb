class Enemies::Destroyer < Enemy
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
