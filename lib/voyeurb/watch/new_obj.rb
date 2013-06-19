module Watch
  class NewObj < Obj
    def initialize(obj_id)
      @x = 0
      @y = 0
      super(obj_id)
    end

    def move
      move_up
    end

    def calling?
      false
    end
  end
end
