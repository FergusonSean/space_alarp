class RoomsController < ApplicationController
  before_filter :find_room
  respond_to :html, :json, :js
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @room }
      format.js
    end
  end
  
  def push_button
    @room.push_button params[:button]
    
    render :js => 'alert("success");'
  end

  def update_page

  end

  def find_room
    @room = Room.find(params[:id])
  end

end
