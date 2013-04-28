class ShipsController < ApplicationController
  def show
    @ship = Ship.find(params[:id])
  end
  
  def new
    @ship = Ship.new
  end

  def join 
    @ship = Ship.find(params[:ship][:id])
    
    redirect_to :action => :show, :id => @ship.id
  end

  def create
    @ship = Ship.build_ship(params[:ship])
    
    redirect_to :action => :show, :id => @ship.id
  end
end
