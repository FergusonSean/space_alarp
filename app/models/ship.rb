class Ship < SpaceAlarpModel
  attr_accessor :mission_start, :sectors, :white_sector, :red_sector, :blue_sector, :game

  def self.build_ship(params = {})
    ship = Ship.new

    @blue_sector = Sector.new_section("blue")
    @white_sector = Sector.new_section("white")
    @red_sector = Sector.new_section("red")

    ship
  end

  def id
    game.id
  end

  def id=(idd)
    game.id = idd
  end

  def upper_white
    white_sector.upper_room
  end

  def lower_white
    white_sector.lower_room
  end

  def upper_red
    red_sector.upper_room
  end

  def lower_red
    red_sector.lower_room
  end

  def upper_blue
    blue_sector.upper_room
  end

  def lower_blue
    blue_sector.lower_room
  end
end
