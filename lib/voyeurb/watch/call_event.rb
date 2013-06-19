module Watch
  class CallEvent < Event
    def to_obj(old)
      CallObj.new(obj_id, old)
    end
  end
end
