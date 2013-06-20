module Watch
  class CallObj < Obj
    def initialize(obj_id, name, method, old)
      @method = method
      @x = old.x
      @y = old.y
      @flashes = 0
      super(obj_id, name)
    end

    def draw_on(board)
      animate(board)
      board.rect(draw_x, draw_y, 32, 32)
      board.text(@method, draw_x, draw_y)
      next_state
    end

    def animate(board)
      color = flash? ? [30, 102, 130] : [255, 0, 0]
      board.fill(*color)
      @flashes += 1
    end

    def next_state
      @flashes > 50 ? NewObj.new(obj_id, name) : self
    end

    def flash?
      @flashes % 2 == 0
    end

  end
end
