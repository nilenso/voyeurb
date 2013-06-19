require_relative '../lib/voyeurb'

Capture.start("Zig", "Foo")

class Zig
  def z; "hi"; end
end

class Foo
  def lame
    "hi"
  end

  def game
    "hi2u"
  end
end

#puts Zig.ancestors
zig = Zig.new
zig.z
String.new("steve")
# a = "christine"
# b = 123.45
# zig.z
# f = Foo.new
# String.new("bleh")
# f.game
# String.new("bleh")
# String.new("bleh")
# f.lame
