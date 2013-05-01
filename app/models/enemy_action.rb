class EnemyAction < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected
  belongs_to :enemy
  
  def trigger!
    enemy = self.enemy
    
    enemy.speed += acceleration if self.acceleration.present?
    enemy.sector.damage! self.damage if self.damage.present?
    enemy.save!
  end
end
