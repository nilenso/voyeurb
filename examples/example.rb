require_relative '../lib/voyeurb'

Capture.capture_methods!.start("Zig", "Foo", "String")

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
zig.z
f = Foo.new
String.new("bleh")
f.game
String.new("bleh")
String.new("bleh")
f.lame
