
# mujo => impermanence

class BasicObject

  def track
    ::ObjectSpace.define_finalizer(self,
                                   self.class.method(:finalize).to_proc)
    ::Zenbu.add(self)
  end

  class << self
    def voyeur_new(*args, &block)
      return newb(*args, &block) if self == Zenbu
      obj = self.allocate
      obj.send :initialize, *args, &block
      obj.send :track
      obj
    end

    alias :newb :new
    alias :new :voyeur_new

    def finalize(object_id)
      Zenbu.remove(object_id)
    end
  end

end
