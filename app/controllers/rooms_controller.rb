class RoomsController < ApplicationController
  def show
    @ship.send(params[:location].to_sym)
  end

  def push_button
    @room = Room.find(params[:id])
    @room.push_button params[:button]

    render :js => 'alert("success");'
  end

end
