module Watch
  class DiedEvent < Event
    def to_obj(old)
      DeadObj.new(obj_id, old)
    end
  end
end
