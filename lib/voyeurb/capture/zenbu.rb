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
      return unless Capture.whitelisted?(obj.class)
      methods.each do |method|
        everything.track_method(obj, method)
      end
    end

    def self.remove(id)
      everything.remove(id)
    end

    def add(obj)
      now = Capture::Shunkan.new.usec
      print_event("BORN", obj.class, obj.object_id)
      @all[obj.object_id] = obj.class.to_s
      obj
    end

    def track_method(obj, method)
      return if obj.is_a?(Class)
      return if obj.respond_to?("orig_#{method}")
      zenbu = self
      obj.class.class_eval do
        original_method = "orig_#{method}"
        new_method = "#{method}"
        alias_method original_method, new_method
        define_method(new_method) do |*args, &block|
          zenbu.print_event("CALL", new_method, obj.object_id)
          obj.send(original_method, *args, &block)
        end
      end
    end

    def remove(id)
      print_event("DIED", @all[id], id)
      @all.delete(id)
    end

    def print_event(what, name, id)
      puts ["VOYEURB", now, what, name, id].join("~")
    end

    def now
      Capture::Shunkan.new.usec
    end
  end
end
