module Watch
  class CallObj < Obj
    def initialize(obj_id, old)
      @x = old.x
      @y = old.y
      @flashes = 0
      super(obj_id)
    end

    def draw_on(board)
      animate(board)
      board.rect(draw_x, draw_y, 16, 16)
      next_state
    end

    def animate(board)
      color = flash? ? [30, 102, 130] : [255, 0, 0]
      board.fill(*color)
      @flashes += 1
    end

    def next_state
      @flashes > 100 ? NewObj.new(obj_id) : self
    end

    def flash?
      @flashes % 2 == 0
    end

  end
end
