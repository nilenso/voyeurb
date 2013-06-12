
# mujo => impermanence

class BasicObject

  class << self
    # def voyeur_new(*args)
    #   puts "making a #{self} with #{args}"
    #   newb(*args)
    # end

    def voyeur_new(*args, &block)
      return newb(*args, &block) if self == Zenbu
      obj = self.allocate
      obj.send :initialize, *args, &block
      Zenbu.add(obj)
      obj
    end
    puts "overwriting new"
    alias :newb :new
    alias :new :voyeur_new
  end

end
