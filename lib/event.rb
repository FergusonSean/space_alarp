class Event
  attr_accessor :time, :block

  def initialize(time, &block)
    @time = time
    @block = block
  end

  def < (other_event)
    @time < other_event.time
  end

  def execute
    @block.call
  end
end
