require 'camping'
require '../lib/voyeurb'

Camping.goes :Blog

module Blog::Models
  class Post < Base; end
end

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
