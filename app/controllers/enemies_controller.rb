class EnemiesController < ApplicationController
  def create
    @enemy = Enemy.create!({
      :name => 'Bad Guy',
      :sector => Sector.find(params[:enemy][:sector_id]),
      :health => params[:enemy][:start_health],
      :speed => params[:enemy][:start_speed],
      :distance => params[:enemy][:start_distance],
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
