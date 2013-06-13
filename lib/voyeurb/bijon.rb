
# bijon => vision
# Processing: http://processing.org/reference/index.html
# Ruby-Processing: https://github.com/jashkenas/ruby-processing/wiki

$LOAD_PATH << File.dirname(__FILE__) + "/../../vendor/gems/timers-1.1.0/lib"
require "timers"

$LOAD_PATH << File.dirname(__FILE__)
require "hassei"

class Bijon < Processing::App

  WIDTH = 800
  HEIGHT = 600

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
    draw_population
  end

  def draw_population
    return unless @population
    @population.values.each do |obj|
      obj.move
      ellipse(obj.x, obj.y, 32, 32)
    end
  end

  # voyeurb stuff:

  def replay(file)
    @events = Hassei.recreate_from(file || "out.txt",
                                   Bijon::WIDTH, Bijon::HEIGHT)
    @population = {}
    @timers = Timers.new
    schedule_next
  end

  def schedule_next
    next_event = @events.delete_at(0)
    return unless next_event
    puts "next event in #{next_event.at} seconds."
    @timers.after(next_event.at) { fire(next_event) }
    wait
  end

  def wait
    return @timers.wait if ENV["DEBUG"]
    Thread.new { @timers.wait }
  end

  def fire(event)
    if event.died?
      @population[event.object_id].kill
    else
      @population[event.object_id] = event
    end
#    p @population
    schedule_next
  end

end

bijon = Bijon.new(:width => Bijon::WIDTH,
                  :height => Bijon::HEIGHT, 
                  :title => "voyeurb", 
                  :full_screen => false)
bijon.replay(ARGV[0])
