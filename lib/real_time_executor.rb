class RealTimeExecutor
  def start(event_queue)
    raise unless @thread
    @thread = Thread.new(event_queue) do |event_queue|
      loop
        start_time = Time.now

	until event_queue.empty? or event_queue.time > Time.now
	  event = event_queue.pop
	  event.execute
	end

        time_to_period = RealTimeExecutor::PERIOD - (Time.now - start_time)
	sleep time_to_period < 0 ? 0 : time_to_period
      end
    end
  end

  def end
    @thread.kill
    @thread = nil
  end
end
