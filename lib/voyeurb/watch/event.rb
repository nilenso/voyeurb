module Watch
  class Event
    attr_accessor :at, :what, :class, :object_id, :x

    def initialize(at, what, name, object_id)
      @at = at
      @what = what
      @name = name
      @object_id = object_id
    end

    def self.from(line)
      parts = line.split(":")
      at = parts[0].to_i # microseconds
      what = parts[1]    # BORN or DIED
      name = parts[2]
      object_id = parts[3]
      case what
      when "BORN"
        Born.new(at, what, name, object_id)
      when "CALL"
        Call.new(at, what, name, object_id)
      when "DIED"
        Died.new(at, what, name, object_id)
      end
    end

    def normalize(epoch)
      magic_speedup = 100
      not_zero = 0.1
      @at = (@at - epoch) / magic_speedup + not_zero
      self
    end
  end

  class Born < Event
    def to_obj
      New.new
    end
  end

  class Died < Event
    def to_obj
      Dead.new
    end
  end

  class Call < Event
    def to_obj
      Calling.new
    end
  end

end
