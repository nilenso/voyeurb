module Watch
  class Board < Processing::App

    WIDTH = 800
    HEIGHT = 600

    def setup
      @population = nil
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
      @population.each do |obj|
        # TODO: make objects responsible for rendering
        obj.move
        rect(obj.x, obj.y, 16, 16) if obj.calling?
        ellipse(obj.x, obj.y, 32, 32) unless obj.calling?
      end
    end

    def replay(file)
      @population = Population.new(file || "out.txt")
    end

  end
end
