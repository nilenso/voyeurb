
# bijon => vision
# Processing: http://processing.org/reference/index.html
# Ruby-Processing: https://github.com/jashkenas/ruby-processing/wiki

class Bijon < Processing::App

  # TODO:
  # 0) create an "object space"
  # 1) read in all the events
  # 2) subtract start time from the rest
  # 3) set a timer for first event
  # 4) on timer fire:
  #    - change state of object space
  #    - set next timer
  # 5) draw should move alive objects up, dead objects down

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

end

Bijon.new(:width => 800, :height => 600, :title => "voyeurb", :full_screen => false)
