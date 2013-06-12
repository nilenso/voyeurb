
# mujo => impermanence

class BasicObject

  class << self
    def voyeur_new(*args, &block)
      return newb(*args, &block) if self == Zenbu
      obj = self.allocate
      obj.send :initialize, *args, &block
      track(obj)
      obj
    end

    alias :newb :new
    alias :new :voyeur_new

    def track(obj)
      ObjectSpace.define_finalizer(self,
                                   self.class.method(:finalize).to_proc)
      Zenbu.add(obj)
    end

    def finalize(id)
      Zenbu.remove(id)
    end
  end

end
