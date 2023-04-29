# typed: true

require "ruby2d"
require "grid"
require "binary_tree"
require "sidewinder"

class GameGrid < Grid
  def initialize(rows, columns)
    super(rows, columns)
  end

  def distances=(distances)
    @distances = distances
    farthest, @maximum = distances.max
  end

  def background_color_for(cell)
    distance = @distances[cell] or return nil
    intensity = (@maximum - distance).to_f / @maximum
    dark = intensity.round(3)
    bright = ((128 + (127 * intensity)) / 255).round(3)

    # p [dark, bright, dark]
    Ruby2D::Color.new([dark, bright, dark, 1])
  end
  def init_display
    img_width = @cell_size * columns
    img_height = @cell_size * rows
    Ruby2D::Window.set width: img_width, height: img_height

    Ruby2D::Window.on :mouse_down do |event|
      start = self[event.y / @cell_size, event.x / @cell_size]

      self.distances = start.distances(true)
    end
  end
  def display()
    Ruby2D::Window.clear
    background = Ruby2D::Color.new("white")
    wall = Ruby2D::Color.new("black")

    %i[backgrounds walls].each do |mode|
      each_cell do |cell|
        x1 = cell.column * @cell_size
        y1 = cell.row * @cell_size

        x2 = (cell.column + 1) * @cell_size
        y2 = (cell.row + 1) * @cell_size

        cell.square =
          Ruby2D::Square.new x: x1,
                             y: y1,
                             size: @cell_size,
                             color: Ruby2D::Color.new("white")

        unless cell.north
          Ruby2D::Line.new x1: x1,
                           y1: y1,
                           x2: x2,
                           y2: y1,
                           width: 1,
                           colour: wall
        end

        unless cell.west
          Ruby2D::Line.new x1: x1,
                           y1: y1,
                           x2: x1,
                           y2: y2,
                           width: 1,
                           colour: wall
        end

        unless cell.west
          Ruby2D::Line.new x1: x1,
                           y1: y1,
                           x2: x1,
                           y2: y2,
                           width: 1,
                           colour: wall
        end

        unless cell.linked?(cell.east)
          Ruby2D::Line.new x1: x2,
                           y1: y1,
                           x2: x2,
                           y2: y2,
                           width: 1,
                           colour: wall
        end

        unless cell.linked?(cell.south)
          Ruby2D::Line.new x1: x1,
                           y1: y2,
                           x2: x2,
                           y2: y2,
                           width: 1,
                           colour: wall
        end
      end
    end
  end
end

grid = GameGrid.new(40, 40)

# Sidewinder.on(grid)
BinaryTree.on(grid)

grid.init_display

grid.display

Ruby2D::Window.show
