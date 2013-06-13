$LOAD_PATH << File.dirname(__FILE__)
require 'bijon'
require 'hassei'

bijon = ::Watch::Bijon.new(:width => Watch::Bijon::WIDTH,
                           :height => Watch::Bijon::HEIGHT,
                           :title => "voyeurb",
                           :full_screen => false)

bijon.replay(ARGV[0])

displayHeight = 0
