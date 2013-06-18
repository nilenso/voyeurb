# mujo => impermanence

class BasicObject
  UNTRACKABLES = [::Capture::Zenbu, ::Capture::Shunkan,
    ::Module, ::Class, ::Gem::Version, ::Gem::Requirement, ::Gem::Dependency]

  def track
    finalizer = self.class.method(:finalize).to_proc
    ::ObjectSpace.define_finalizer(self, finalizer)
    ::Capture::Zenbu.add(self)
    # ::Capture::Zenbu.track_methods(self, self.public_methods(false))
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
      ::Capture::Zenbu.remove(object_id)
    end
  end
end
