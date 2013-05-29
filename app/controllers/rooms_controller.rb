class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def push_button
    @room = Room.find(params[:id])
    @room.push_button params[:button]
    
    render :js => 'alert("success");'
  end

end
