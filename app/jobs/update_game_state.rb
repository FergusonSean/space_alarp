class UpdateGameState
  @queue = :default
  
  def self.perform
    #update game state for all games
    Ship.where('mission_start IS NOT NULL AND mission_start > ?', Time.now.utc - 10.minutes).each do |ship|
      ship.update_game!
      ship.sectors.map(&:enemies).flatten.each(&:regen_shields)
    end
  end
end