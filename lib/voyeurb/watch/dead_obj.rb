module Watch
  class DeadObj < Obj
    def initialize(obj_id, old)
      @x = old.x
      @y = old.y
      super(obj_id)
    end

    def draw_on(board)
      move_down
      board.fill(64, 64, 64)
      board.ellipse(draw_x, draw_y, 32, 32)
    end

    def move_down
      @x = @x + 1
      @y = @y - 1
    end

  end
end
