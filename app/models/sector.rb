class Sector < ActiveRecord::Base
  attr_accessible :color
  
  has_many :rooms
end
