class EnemyAction < SpaceAlarpModel
  attr_accessor :enemy, :damage, :acceleration, :distance

  def trigger!
    enemy = self.enemy

    enemy.speed += acceleration if self.acceleration.present?
    enemy.sector.damage! self.damage if self.damage.present?
    enemy.save!
  end
end
