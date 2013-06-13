
# bijon => vision
# Processing: http://processing.org/reference/index.html
# Ruby-Processing: https://github.com/jashkenas/ruby-processing/wiki

$LOAD_PATH << File.dirname(__FILE__) + "/../../vendor/gems/timers-1.1.0/lib"
require "timers"

$LOAD_PATH << File.dirname(__FILE__)
require "hassei"

class Bijon < Processing::App

  def setup
    alpha = 0.5
    @background = [0.06, 0.03, 0.18, alpha]
    color_mode RGB, 1
    ellipse_mode CORNER
    smooth
  end

  def draw_background
    fill *@background if @background[0]
    rect 0, 0, width, height
  end

  def draw
    draw_background
    fill(204, 102, 0)
    ellipse(50, 75, 32, 32)
  end

  # voyeurb stuff:

  def replay(file)
    @events = Hassei.recreate_from(file || "out.txt")
    @population = []
    @timers = Timers.new
    schedule_next
  end

  def schedule_next
    next_event = @events.delete_at(0)
    return unless next_event
    puts "next event in #{next_event.at} seconds."
    @timers.after(next_event.at) { fire(next_event) }
    Thread.new { @timers.wait }
  end

  def fire(event)
    @population << event
#    p @population
    schedule_next
  end

  # TODO:
  # x) create an "object space"
  # x) read in all the events
  # x) subtract start time from the rest
  # x) set a timer for first event
  # x) on timer fire:
  # x  - change state of object space
  # x  - set next timer
  # 5) draw should move alive objects up, dead objects down

end

bijon = Bijon.new(:width => 800, 
                  :height => 600, 
                  :title => "voyeurb", 
                  :full_screen => false)
bijon.replay(ARGV[0])
