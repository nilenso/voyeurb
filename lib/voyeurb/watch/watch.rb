# $LOAD_PATH << File.dirname(__FILE__)
# require 'bijon'
# require 'hassei'

# bijon = ::Watch::Bijon.new(:width => Watch::Bijon::WIDTH,
#                            :height => Watch::Bijon::HEIGHT,
#                            :title => "voyeurb",
#                            :full_screen => false)

# bijon.replay(ARGV[0])

$LOAD_PATH << File.dirname(__FILE__) + "/../../../vendor/gems/timers-1.1.0/lib"
require 'timers'

$LOAD_PATH << File.dirname(__FILE__)
require 'obj'
require 'new_obj'
require 'call_obj'
require 'dead_obj'
require 'population'
require 'event'
require 'born_event'
require 'call_event'
require 'died_event'
require 'events'
require 'board'

board = ::Watch::Board.new(:width => Watch::Board::WIDTH,
                       :height => Watch::Board::HEIGHT,
                       :title => "voyeurb",
                       :full_screen => false)

board.replay(ARGV[0])

