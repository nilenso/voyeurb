module Watch
  class Obj

    attr_accessor :obj_id, :name, :x, :y

    def initialize(obj_id, name)
      @width = Board::WIDTH
      @height = Board::HEIGHT
      @obj_id = obj_id
      @name = name
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
               NewObj.new(obj_id, name)
             when "CALL"
               CallObj.new(obj_id, name, event.name, self)
             when "DIED"
               DeadObj.new(obj_id, name, self)
             end
    end
  end
end
