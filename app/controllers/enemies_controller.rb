class EnemiesController < ApplicationController
  def create
    Enemy.create!({
      :name => 'Bad Guy',
      :sector => Sector.first,
      :health => 8,
      :speed => 2,
      :distance => 13,
      :enemy_actions_attributes => [
        {
          :distance => 10,
          :damage => 1
        },
        {
          :distance => 5,
          :damage => 2
        },
        {
          :distance => 1,
          :damage => 3
        }
      ]
      
    })
    
    render :none => true
  end
end
