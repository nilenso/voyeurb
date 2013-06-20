module Watch
  class Events

    def initialize(events, &block)
      @events = events
      @callback = block
      @timers = Timers.new
      schedule_next
    end

    def self.create_from(file, &block)
      events = squash(hann(normalize(parse_file(file))))
      Events.new(events, &block)
    end

    private

    def schedule_next
      next_event = @events.delete_at(0)
      return unless next_event
      puts "next event in #{next_event.delay} seconds."
      @timers.after(next_event.delay) { fire(next_event) }
      wait
    end

    def wait
      return @timers.wait if ENV["DEBUG"]
      Thread.new { @timers.wait }
    end

    def fire(event)
      @callback.call(event)
      schedule_next
    end

    def self.parse_file(file)
      events = []
      File.open(file) do |f|
        f.each {|line| events << Event.from(line) }
      end
      events.compact
    end

    def self.normalize(events)
      debug_delays("unsquashed:", events.
            map {|e| e.normalize(events[0]) }.
            reduce([]) {|evs, e| evs << e.with_delay(evs.last) })
    end

    def self.squash(events)
      slowest = events.reduce {|ceil, e| e.max(ceil) }
      debug_delays("final:", events.map {|e| e.squash(slowest.delay) })
    end

    def self.hann(events)
      debug_delays("hanned:", events.map {|e| e.hann(events.length) }) 
    end

    def self.debug_delays(label, events)
      puts ""
      puts label
      p events.map {|e| e.delay}
      events
    end
  end
end
