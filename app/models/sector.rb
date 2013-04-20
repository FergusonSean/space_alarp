class Sector < ActiveRecord::Base
  attr_accessible :color
  
  has_many :rooms
  
  belongs_to :ship
end
