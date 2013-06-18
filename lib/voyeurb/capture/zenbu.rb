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

    def self.track_methods(obj, methods)
      methods.each do |method|
        everything.aop_method(obj, method)
      end
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

    def track_method(obj, method)
      obj.class.class_eval do
        original_method = "orig_#{method}"
        new_method = "#{method}"
        alias_method original_method, new_method
        define_method(new_method) do
          now = Capture::Shunkan.new.usec
          puts "#{now}:CALL:#{new_method}:#{obj.object_id}"
          obj.send(original_method)
        end
      end
    end

    def remove(id)
      now = Capture::Shunkan.new.usec
      puts "#{now}:DIED:#{@all[id]}:#{id}"
      @all.delete(id)
    end
  end
end
