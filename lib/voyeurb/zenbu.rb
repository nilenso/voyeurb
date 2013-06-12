
# zenbu => everything

class Zenbu

  def initialize
    @all = {}
  end

  # TODO: give the lib a nicer entrypoint
  def self.everything
    @@everything ||= Zenbu.new
  end

  def self.add(obj)
    everything.add(obj)
  end

  def self.remove(id)
    everything.remove(id)
  end

  def add(obj)
    puts "made a #{obj.class} with id #{obj.object_id}"
    @all[obj.object_id] = obj
    obj
  end

  def remove(id)
    puts "destroyed a #{@all[id].class} with id #{id}"
    @all.delete(id).tap
  end
end
