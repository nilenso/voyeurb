module Watch
  class Event
    MARKER = "VOYEURB~"

    attr_accessor :at, :what, :name, :obj_id, :delay

    def initialize(at, what, name, obj_id, delay = 0)
      @at = at
      @what = what
      @name = name
      @obj_id = obj_id
      @delay = delay
    end

    def self.from(line)
      return unless line.start_with?(MARKER)
      parts = line.gsub(MARKER, "").strip.split("~")
      at = parts[0].to_i # microseconds
      what = parts[1]    # BORN or DIED
      name = parts[2]
      obj_id = parts[3]
      Event.new(at, what, name, obj_id)
    end

    def new_delay(delay)
      Event.new(@at, @what, @name, @obj_id, delay)
    end

    def normalize(genesis)
      Event.new(@at - genesis.at, @what, @name, @obj_id)
    end

    def with_delay(prev)
      delay = prev.nil? ? 1.0 : @at - prev.at
      new_delay(delay.to_f)
    end

    def squash(ceiling)
      max_seconds = 2.0
      delay = max_seconds * (@delay / ceiling)
      new_delay(delay)
    end

    def hann(big_n)
      numerator = 2 * Math::PI * @delay
      denominator = big_n - 1
      delay = 0.5 * (1.0 - Math.cos(numerator / denominator))
      new_delay(delay)
    end

    def max(other)
      @delay > other.delay ? self : other
    end

  end
end
