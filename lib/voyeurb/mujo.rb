
# mujo => impermanence

class BasicObject

  UNTRACKABLES = [::Zenbu, ::Shunkan]

  def track
    finalizer = self.class.method(:finalize).to_proc
    ::ObjectSpace.define_finalizer(self, finalizer)
    ::Zenbu.add(self)
  end

  class << self
    def voyeur_new(*args, &block)
      return newb(*args, &block) unless trackable
      obj = self.allocate
      obj.send :initialize, *args, &block
      obj.send :track
      obj
    end

    alias :newb :new
    alias :new :voyeur_new

    def trackable
      return false if UNTRACKABLES.include?(self)
      true
    end

    def finalize(object_id)
      Zenbu.remove(object_id)
    end
  end

end
