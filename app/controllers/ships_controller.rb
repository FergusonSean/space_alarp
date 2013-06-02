class ShipsController < ApplicationController

  skip_before_filter :find_game, :only => [:new, :create]
  def show
    @enemy = Enemy.new
  end

  def new
    @ship = Ship.new(:game => @game)
    @game = Game.new @ship
  end

  def join
    redirect_to :action => :show, :id => @ship.id
  end

  def create
    @ship = Ship.build_ship(params[:ship])
    @game = Game.new(@ship)
    @game.save

    redirect_to :action => :show, :id => @game.id
  end

  def start_mission
    @game.start
    render :text => "OK"
  end
end
