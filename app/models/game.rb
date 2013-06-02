require 'real_time_executor'
require 'minheap'

class Game

  attr_accessor :ship, :executor, :event_queue, :start_time, :id

  def initialize(ship, executor = RealTimeExecutor.new)
    @executor = executor
    @ship = ship
  end

  def save
    @event_queue = MinHeap.new
    MemoryStore.add_game(self)
  end

  def end_time
    start_time + 10.minutes
  end

  def start
    @start_time = Time.now
    executor.start event_queue
  end

  def stop
    executor.stop
  end
end
