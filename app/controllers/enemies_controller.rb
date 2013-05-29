class EnemiesController < ApplicationController
  def create
    @enemy = Enemy.create!(params[:enemy].merge({
      :name => (params[:health] > 8 ? 'REALLY BAD GUY' : 'bad guy'),
      :sector => Sector.find(params[:enemy][:sector_id]),
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
      
    }))
    
    redirect_to :action => :show, :controller => :ships, :id => @enemy.sector.ship.id 
  end
end
