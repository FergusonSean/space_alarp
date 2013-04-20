class Room < ActiveRecord::Base
  attr_accessible :level, :power, :sector_id
  
  belongs_to :sector
  
  def push_button(letter)
  #  TODO make this do something
    true
  end
end
