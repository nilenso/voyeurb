module Watch
  class Population
    def initialize(file)
      @objs = {}
      @events = Events.create_from(file) {|event| alter(event) }
    end

    def alter(obj)
      @objs[obj.object_id] = obj
      # if event.died?
      #   @objs[event.object_id].kill
      # elsif event.called?
      #   @objs[event.object_id].call_method(event.class) #actually, method.
      # else
      #   @objs[event.object_id] = event
      # end
    end

    def each(&block)
      @objs.values.each(&block)
    end

  end
end
