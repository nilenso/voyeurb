module Watch
  class Obj

    attr_accessor :x

    def initialize
      @width = Board::WIDTH
      @height = Board::HEIGHT
      @x = 0
      @y = 0
    end

    def y
      @height - @y
    end

    def move
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

    def calling?
      false
    end
  end

  class New < Obj
    def move
      move_up
    end
  end

  class Dead < Obj
    def move
      move_down
    end
  end

  class Calling < Obj
    def move
      move_up
    end

    def calling?
      true
    end
  end
end
