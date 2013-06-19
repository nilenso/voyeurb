# mujo => impermanence

BINDING = self

module Capture
  @init = lambda {
    class ::BasicObject
      UNTRACKABLES = [::Capture::Zenbu,
        ::Capture::Shunkan,
        ::Module,
        ::Class,
        ::Gem::Version,
        ::Gem::Requirement,
        ::Gem::Dependency]

      def track
        finalizer = self.class.method(:finalize).to_proc
        ::ObjectSpace.define_finalizer(self, finalizer)
        ::Capture::Zenbu.add(self)
        if ::Capture.capture_methods?
          ::Capture::Zenbu.track_methods(self, self.public_methods(false))
        end
      end

      class << self
        def voyeur_new(*args, &block)
          return newb(*args, &block) unless trackable
          obj = self.allocate
          obj.send :initialize, *args, &block
          obj.send :track
          obj
        end

        alias :newb :new
        alias :new :voyeur_new

        def trackable
          return false if UNTRACKABLES.include?(self)
          return false unless Capture.whitelisted?(self)
          true
        end

        def finalize(object_id)
          ::Capture::Zenbu.remove(object_id)
        end
      end
    end
  }

  def self.capture_methods!
    @capture_methods = true
    self
  end

  def self.start(*whitelist)
    @whitelist = whitelist
    @init.call
  end

  def self.start_firehose
    @whitelist = []
    @whitelist_all = true
    @init.call
  end

  def self.capture_methods?
    @capture_methods
  end

  def self.whitelisted?(klass)
    whitelist.include?(klass) || @whitelist_all
  end

  def self.whitelist
    @whitelist.map {|sym| BINDING.class.const_get(sym) }
  end

end
