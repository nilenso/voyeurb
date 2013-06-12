
class BasicObject

#   class << self
#     def voyeur_new(*args)
#       puts "making a #{self}"
#       newb(*args)
#     end
#     alias :newb :new
#     alias :new :voyeur_new
#   end

  def voyeur_initialize(*args)
    puts "making a #{self}"
    initializeb(*args)
  end
  alias :initializeb :initialize
  alias :initialize :voyeur_initialize

  # def self.inherited(subclass)
  #   def subclass.initialize(*args)
  #     puts "init'd"
  #   end
  # end
end

# class Class
#   def voyeur_new(*args)
#     puts "zig"
#     newb(*args)
#   end

#   alias :newb :new
#   alias :new :voyeur_new
# end

class Zig
  def z; puts "hi"; end
end

Zig.new.z
String.new("steve")
a = "christine"
b = 123.45
