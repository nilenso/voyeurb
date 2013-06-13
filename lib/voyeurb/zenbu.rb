
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
    puts "#{Shunkan.new}:BORN:#{obj.class}:#{obj.object_id}"
    @all[obj.object_id] = obj.class.to_s
    obj
  end

  def remove(id)
    puts "#{Shunkan.new}:DIED:#{@all[id]}:#{id}"
    @all.delete(id)
  end
end
