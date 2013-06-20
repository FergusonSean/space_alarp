module ShipsHelper

  def option_for_enemy_type_select
    Enemy::ENEMY_TYPES.map do |subclass|
      [subclass.demodulize.titleize, subclass]
    end
  end
end
