require 'test_helper'

class EnemyTest < ActiveSupport::TestCase
  def test_damage__hp_reduced
    enemy = Enemy.create :health => 3
    enemy.damage! 2
    assert_equal 1, enemy.health
  end

  def test_damage__shields_reduce_damage
    enemy = Enemy.create :health => 3, :max_shield_strength => 3

    puts "!!!!!#{enemy.health}/#{enemy.current_shield_strength}"

    enemy.damage! 2
    assert_equal 3, enemy.health
    assert_equal 1, enemy.current_shield_strength

    enemy.damage! 2
    assert_equal 2, enemy.health
    assert_equal 0, enemy.current_shield_strength
  end
end
