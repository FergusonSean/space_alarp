class Enemy < ActiveRecord::Base
  attr_protected
  belongs_to :sector

  ENEMY_TYPES = ['Enemies::ArmoredGrappler', 'Enemies::Destroyer']
 
  def initialize(arguments = {}, options = {})
    super(arguments, options)
    self.name = self.class.name.demodulize.titleize unless arguments.include? :name
    self.health = 6 unless arguments.include? :health
    self.max_shield_strength = 1 unless arguments.include? :max_shield_strength
    self.speed = 2 unless arguments.include? :speed
    self.distance = 13 unless arguments.include? :distance
    self.action_distances = "10,5,1" unless arguments.include? :action_distances

    regen_shields
  end

  def damage!(amount)
    self.current_shield_strength -= amount

    if current_shield_strength < 0
      self.health += self.current_shield_strength
      self.current_shield_strength = 0
    end
    
    self.save!
  end

  def regen_shields
    self.current_shield_strength = self.max_shield_strength
  end
  
  def alive?
    health > 0
  end
  
  def move!
    new_distance = self.distance - self.speed
    return if self.distance - new_distance < 1

    action_distances_array = action_distances.split(',').map(&:to_i)
    pp action_distances_array
    action_distances_array.each do |threshold|
      pp threshold
      next unless threshold.between?(new_distance, self.distance-1)

      if threshold == action_distances_array.first
        puts "trying x"
        enemy_action_x
      elsif threshold == action_distances_array.last
        puts "trying z"
        enemy_action_z
      else
        puts "trying y"
        enemy_action_y
      end
    end

    self.distance = new_distance
    self.save!
  end
end
