module Watch
  class Population
    def initialize(file)
      @objs = {}
      @events = Events.create_from(file) {|event| alter(event) }
    end

    def alter(event)
      p event
      old = @objs[event.obj_id] || NewObj.new(event.obj_id, event.name)
      @objs[old.obj_id] = old.on(event)
    end

    def each(&block)
      @objs.values.each(&block)
    end

    def update(next_state)
      @objs[next_state.obj_id] = next_state
    end
  end
end
