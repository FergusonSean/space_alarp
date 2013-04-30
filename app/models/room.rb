class Room < ActiveRecord::Base
  attr_accessible :level, :power, :sector_id
  
  belongs_to :sector
  
  def push_button(letter)
  #  TODO make this do something
    "alert('dumb');"
  end
  
  def location
    "#{upper? ? 'Upper': 'Lower'} #{sector.color.titlecase} Sector"
  end
  
  def upper?
    level == 2
  end
end
