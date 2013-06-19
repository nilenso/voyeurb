module Watch
  class BornEvent < Event
    def to_obj(old = "ignored")
      NewObj.new(obj_id)
    end
  end
end
