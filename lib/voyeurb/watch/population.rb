module Watch
  class Population
    def initialize(file)
      @objs = {}
      @events = Events.create_from(file) {|event| alter(event) }
    end

    def alter(event)
      # TODO: change to state machine instead
      old_obj = @objs[event.obj_id]
      new_obj = event.to_obj(old_obj)
      @objs[event.obj_id] = new_obj
    end

    def each(&block)
      @objs.values.each(&block)
    end

    def replace(next_state)
      @objs[next_state.obj_id] = next_state
    end
  end
end
