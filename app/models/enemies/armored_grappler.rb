class Enemies::ArmoredGrappler < Enemy
  def enemy_action_x
    sector.damage! 1
  end

  def enemy_action_y
    health += 1
  end

  def enemy_action_z
    sector.damage! 4
  end
end
