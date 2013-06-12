
class BasicObject

  class << self
    def voyeur_new(*args)
      puts "making a #{self}"
      newb(*args)
    end
    alias :newb :new
    alias :new :voyeur_new
  end

end

class Zig
  def z; puts "hi"; end
end

Zig.new.z
String.new("steve")
a = "christine"
b = 123.45
