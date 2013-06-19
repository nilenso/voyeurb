module Watch
  class Event

    attr_accessor :at, :what, :class, :object_id, :x

    def initialize(line)
      parts = line.split(":")
      @at = parts[0].to_i # microseconds
      @what = parts[1]    # BORN or DIED
      @class = parts[2]
      @object_id = parts[3]

      @width = Board::WIDTH
      @height = Board::HEIGHT
      @x = 0
      @y = 0
      @calling = false
    end

    def y
      @height - @y
    end

    def move
      move_up if born?
      move_down if died?
    end

    def movesize_x
      1.0 - (@x / @width)
    end

    def movesize_y
      1.0 - (@y / @height)
    end

    def move_up
      @x = @x + movesize_x
      @y = @y + movesize_y
    end

    def move_down
      @x = @x + 1
      @y = @y - 1
    end

    # TODO: events / objects / methods need to be separated.
    def call_method(name)
      @calling = true
    end

    def calling?
      @calling
    end

    def normalize(epoch)
      magic_speedup = 100
      not_zero = 0.1
      @at = (@at - epoch) / magic_speedup + not_zero
      self
    end

    def kill
      @what = "DIED"
    end

    def born?
      @what == "BORN"
    end

    def died?
      @what == "DIED"
    end

    def called?
      @what == "CALL"
    end

  end
end
