class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def push_button
    button_letter = params[:button]
    
    respond_with @room.push_button(button_letter)
  end

end
