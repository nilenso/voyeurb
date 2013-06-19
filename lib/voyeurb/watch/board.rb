module Watch
  class Board < Processing::App

    WIDTH = 800
    HEIGHT = 600

    def setup
      @population = nil
      @background = [0.06, 0.03, 0.18, alpha = 1.0]
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
      draw_population
    end

    def draw_population
      return unless @population
      @population.each {|obj| @population.update(obj.draw_on(self)) }
    end

    def replay(file)
      @population = Population.new(file || "out.txt")
    end

  end
end
