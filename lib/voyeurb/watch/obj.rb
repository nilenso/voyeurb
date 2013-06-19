module Watch
  class Obj

    attr_accessor :obj_id, :x, :y

    def initialize(obj_id)
      @width = Board::WIDTH
      @height = Board::HEIGHT
      @obj_id = obj_id
    end

    def draw_on(board)
      raise Exception.new("not implemented")
    end

    def draw_x
      x
    end

    def draw_y # upside-down
      @height - @y
    end

    def on(event)
      return case event.what
             when "BORN"
               NewObj.new(obj_id)
             when "CALL"
               CallObj.new(obj_id, self)
             when "DIED"
               DeadObj.new(obj_id, self)
             end
    end
  end
end
