class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def push_button
    @room = Room.find(params[:id])
    button_letter = params[:button]
    
    render :js => @room.push_button(button_letter)
  end

end
