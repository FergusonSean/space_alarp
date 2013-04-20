class ShipsController < ApplicationController
  def show
  end
  
  def new
    @ship = Ship.new
  end

  def create
    puts "I am a lovely bunch of coconuts"
    
    @ship = Ship.build_ship(params[:ship])
    
    redirect_to :action => :show, :id => @ship.id
  end
end
