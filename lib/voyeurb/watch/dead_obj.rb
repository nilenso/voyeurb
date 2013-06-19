module Watch
  class DeadObj < Obj
    def initialize(obj_id, old)
      @x = old.x
      @y = old.y
      super(obj_id)
    end

    def move
      move_down
    end

    def calling?
      false
    end
  end
end
