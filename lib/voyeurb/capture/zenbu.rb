
# zenbu => everything

module Capture
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
      now = Capture::Shunkan.new.usec
      puts "#{now}:BORN:#{obj.class}:#{obj.object_id}"
      @all[obj.object_id] = obj.class.to_s
      obj
    end

    def remove(id)
      now = Capture::Shunkan.new.usec
      puts "#{now}:DIED:#{@all[id]}:#{id}"
      @all.delete(id)
    end
  end
end
