module Watch
  class Obj

    attr_accessor :obj_id, :x, :y

    def initialize(obj_id)
      @width = Board::WIDTH
      @height = Board::HEIGHT
      @obj_id = obj_id
    end

    def draw_x
      x
    end

    def draw_y # upside-down
      @height - @y
    end

    def move
      raise "not implemented"
    end

    def calling?
      raise "not implemented"
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
  end
end
