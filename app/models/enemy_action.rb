class EnemyAction < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected
  belongs_to :enemy
end
