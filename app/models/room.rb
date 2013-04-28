class Room < ActiveRecord::Base
  attr_accessible :level, :power, :sector_id
  
  belongs_to :sector
  
  def push_button(letter)
  #  TODO make this do something
    true
  end
  
  def location
    "#{level == 2 ? 'Upper': 'Lower'} #{sector.color.titlecase} Sector"
  end
end
