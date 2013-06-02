require 'real_time_executor'
require 'minheap'

class Game
  attr_accessor :ship, :executor, :event_queue

  def initialize(executor: RealTimeExecutor.new)
    @event_queue = MinHeap.new
    @ship = Ship.new
    @executor = executor
  end

  def start
    executor.start event_queue
  end

  def stop
    executor.stop
  end
end
