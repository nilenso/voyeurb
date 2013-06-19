require 'camping'
require_relative '../lib/voyeurb'

Camping.goes :Blog

Capture.capture_methods!.start("Rack::Request", "Rack::Response",
                         "WEBrick::HTTPRequest", "WEBrick::HTTPResponse",
                         "URI::HTTP", "Blog::H",
                         "Blog::Controllers::Index", "Blog::Controllers::I")

# module Blog::Models
#   class Post < Base; end
# end

module Blog::Controllers
  class Index
    def get
      # @posts = Post.all
      render :index
    end
  end

  class GC < R "/gc"
    def get
      render :gc
    end
  end
end

module Blog::Views
  def index
    h1 "index"
  end

  def gc
    ::GC.start
    h1 "ok"
  end
end
