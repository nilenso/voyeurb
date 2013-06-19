module Watch
  class CallObj < Obj
    def initialize(obj_id, old)
      @x = old.x
      @y = old.y
      super(obj_id)
    end

    def move
      move_up
    end

    def calling?
      true
    end
  end
end
