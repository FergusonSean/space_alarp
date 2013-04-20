class Ship < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :sectors
end
