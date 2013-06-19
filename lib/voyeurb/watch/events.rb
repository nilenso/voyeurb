module Watch
  class Events

    def initialize(events, &block)
      @events = events
      @callback = block
      @timers = Timers.new
      schedule_next
    end

    def schedule_next
      next_event = @events.delete_at(0)
      return unless next_event
      puts "next event in #{next_event.at} seconds."
      @timers.after(next_event.at) { fire(next_event) }
      wait
    end

    def wait
      return @timers.wait if ENV["DEBUG"]
      Thread.new { @timers.wait }
    end

    def fire(event)
      @callback.call(event)
      #    p @population
      schedule_next
    end

    def self.create_from(file, &block)
      events = []
      File.open(file) do |f|
        f.each {|line| events << Event.new(line) }
      end
      epoch = events[0].at
      events.map {|e| e.normalize(epoch) }
      Events.new(events, &block)
    end

  end
end
