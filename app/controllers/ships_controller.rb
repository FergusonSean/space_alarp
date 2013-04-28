class ShipsController < ApplicationController
  def show
    @ship = Ship.find(params[:id])
  end
  
  def new
    @ship = Ship.new
  end

  def join 
    @ship = Ship.find(params[:ship][:id])
  end

  def create
    puts "I am a lovely bunch of coconuts"
    
    @ship = Ship.build_ship(params[:ship])
    
    redirect_to :action => :show, :id => @ship.id
  end
end
