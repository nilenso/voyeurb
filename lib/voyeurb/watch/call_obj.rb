module Watch
  class CallObj < Obj
    def initialize(obj_id, old)
      @x = old.x
      @y = old.y
      super(obj_id)
    end

    def draw_on(board)
      board.fill(30, 102, 130)
      board.rect(draw_x, draw_y, 16, 16)
    end

    def calling?
      true
    end
  end
end
