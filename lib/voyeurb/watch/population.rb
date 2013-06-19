module Watch
  class Population
    def initialize(file)
      @objs = {}
      @events = Events.create_from(file) {|event| alter(event) }
    end

    def alter(event)
      old_obj = @objs[event.obj_id]
      new_obj = event.to_obj(old_obj)
      @objs[event.obj_id] = new_obj
    end

    def each(&block)
      @objs.values.each(&block)
    end

  end
end
