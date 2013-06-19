module Watch
  class Event
    attr_accessor :at, :what, :class, :obj_id, :x

    def initialize(at, what, name, obj_id)
      @at = at
      @what = what
      @name = name
      @obj_id = obj_id
    end

    def self.from(line)
      parts = line.strip.split(":")
      at = parts[0].to_i # microseconds
      what = parts[1]    # BORN or DIED
      name = parts[2]
      obj_id = parts[3]
      Event.new(at, what, name, obj_id)
    end

    def normalize(epoch)
      magic_speedup = 200
      not_zero = 0.1
      @at = (@at - epoch) / magic_speedup + not_zero
      self
    end
  end
end
