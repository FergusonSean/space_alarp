class RoomController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def update
  end
end
