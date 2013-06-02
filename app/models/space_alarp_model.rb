require "informal"

class SpaceAlarpModel
  include Informal::Model

  def initialize(params = {})
    params.each do |field, value|
      send(:"#{field}=", value)
    end
    self
  end
end