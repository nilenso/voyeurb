
# hassei => occurrence

class Hassei

  attr_accessor :at, :what, :class, :object_id

  def initialize(line)
    parts = line.split(":")
    @at = parts[0].to_i # microseconds
    @what = parts[1]    # BORN or DIED
    @class = parts[2]
    @object_id = parts[3]
  end

  def born?
    @what == "BORN"
  end

  def died?
    @what == "DIED"
  end

  def normalize(epoch)
    magic_speedup = 100
    not_zero = 0.1
    @at = (@at - epoch) / magic_speedup + not_zero
    self
  end

  def self.recreate_from(file)
    raw_events = []
    File.open(file) do |f|
      f.each {|line| raw_events << Hassei.new(line) }
    end
    epoch = raw_events[0].at
    raw_events.map {|e| e.normalize(epoch) }.tap do |events|
      puts "event list:"
      p events
    end
  end

end
