module Watch
  class NewObj < Obj
    def initialize(obj_id, name, x = 0, y = 0)
      @x = x
      @y = y
      super(obj_id, name)
    end

    def draw_on(board)
      move_up
      board.fill(204, 102, 0)
      board.ellipse(draw_x, draw_y, 32, 32)
      board.text(name, draw_x, draw_y)
      self
    end

    def move_up
      @x = @x + movesize_x
      @y = @y + movesize_y
    end

    def movesize_x
      (1.0 - (@x / @width)) / 4.0
    end

    def movesize_y
      (1.0 - (@y / @height)) / 4.0
    end

  end
end
