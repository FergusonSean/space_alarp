class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_game

  def find_game
    @game = MemoryStore.get(params[:id])
    @ship = @game.ship
  end
end
