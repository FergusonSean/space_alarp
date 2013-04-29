class Enemy < ActiveRecord::Base
  attr_protected
  has_many :enemy_actions
  belongs_to :sector
  accepts_nested_attributes_for :enemy_actions
end
