class EnemiesController < ApplicationController
  def create
    @enemy = Enemy.create!({
      :name => 'Bad Guy',
      :sector => Sector.find(params[:enemy][:sector_id]),
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
    
    redirect_to :action => :show, :controller => :ships, :id => @enemy.sector.ship.id 
  end
end
