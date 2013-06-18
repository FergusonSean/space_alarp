class EnemiesController < ApplicationController
  def create
    @enemy = Enemy.create!(params[:enemy].merge({
      :name => (params[:enemy][:health].to_i > 8 ? 'REALLY BAD GUY' : 'bad guy'),
      :sector => Sector.find(params[:enemy][:sector_id]),
      :action_distances => '10, 5, 1'
    }))
    
    redirect_to :action => :show, :controller => :ships, :id => @enemy.sector.ship.id 
  end
end
