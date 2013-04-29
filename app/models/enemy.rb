class Enemy < ActiveRecord::Base
  attr_accessible :current_shield_strength, :distance, :health, :max_shield_strength, :name, :sector_id, :speed
end
