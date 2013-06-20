class EnemiesController < ApplicationController
  def create

    @enemy = params[:enemy].delete(:type).constantize.create!(params[:enemy].merge({
      :sector => Sector.find(params[:enemy][:sector_id])
    }))
    
    redirect_to :action => :show, :controller => :ships, :id => @enemy.sector.ship.id 
  end
end
