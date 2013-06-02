class MemoryStore
  @games = {}

  def self.add_game(game)
    key = @games.blank? ? 1 : @games.keys.max + 1
    game.id = key
    @games[key] = game
  end

  def self.remove_game(id)
    @games.delete(id)
  end

  def self.get(id)
    @games[id]
  end

  def self.games
    @games.values
  end
end