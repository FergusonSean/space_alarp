class Room < SpaceAlarpModel

  attr_accessor :sector, :level, :power, :ordinance, :maximum_power
  attr_accessor :disabled_a, :disabled_b

  def self.button_cooldown
    Rails.application.config.button_cooldown_seconds.seconds
  end

  def self.effect_time
    Rails.application.config.effect_time_seconds.seconds
  end

  def self.buttons_cooldown_seperately?
    Rails.application.config.buttons_cooldown_seperately
  end

  def game
    sector.ship.game
  end

  def push_button(letter)
    letter == 'A' ? push_a_button : push_b_button
  end

  def find_target
    sector.enemies.sort_by(&:distance).select { |enemy| enemy.alive? }.first
  end

  def fire_laser(power, cost = 1)
    find_target.damage!(power) if find_target.present?
    sector.use_power!(cost)
  end

  def enabled_for_a_button?
    Room.buttons_cooldown_seperately? ? !disabled_a : !(disabled_a or disabled_b)
  end

  def enabled_for_b_button?
    Room.buttons_cooldown_seperately? ? !disabled_b : !(disabled_a or disabled_b)
  end

  def push_a_button
    return false unless enabled_for_a_button?

    game.event_queue << Event.new(0.seconds) do
      @disabled_a = true
    end
    game.event_queue << Event.new(Room.button_cooldown) do
      @disabled_a = false
    end
    game.event_queue << Event.new(Room.effect_time) do
      process_a
    end

  end

  def process_a
    return unless a_button_pressed?
    if upper?
      if sector.lower_room.power > 0
        if sector.red?
          fire_laser 4
        elsif sector.white?
          fire_laser 5
        else
          fire_laser 4
        end
      end
    else
      if sector.red?
        fire_laser 2, 0
      elsif sector.white?
        if power > 0
          targets = sector.ship.sectors.map { |s| s.lower_room.find_target }.compact
          targets.select { |t| t.distance < 8 }.each do |target|
            target.damage! 1
          end
          sector.use_power! 1
        end
      else
        fire_laser 2, 0
      end
    end

    update_attributes! :a_button_pressed => false
  end

  def power_shield!
    pull_power_from(self.sector.lower_room)
  end

  def pull_power_from(room)
    power_to_pull = [self.maximum_power - self.power, room.power].min
    self.power += power_to_pull
    self.save!
    room.power -= power_to_pull
    room.save
  end

  def pull_power!
    pull_power_from(sector.ship.white_sector.lower_room)
  end

  def generate_power!
    self.power = self.maximum_power if ordinance > 0
    self.ordinance -= 1
    self.save
  end

  def push_b_button
    self.update_attributes! :b_button_pressed => true
  end

  def process_b
    return unless b_button_pressed?
    if upper?
      power_shield!
    else
      if sector.white?
        generate_power!
      else
        pull_power!
      end
    end
    update_attributes! :b_button_pressed => false
  end

  def location
    "#{upper? ? 'Upper' : 'Lower'} #{sector.color.titlecase} Sector"
  end

  def upper?
    level == 2
  end
end
