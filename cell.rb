# typed: true
require("distances")
require "ruby2d"
class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west
  attr_accessor :square

  def initialize(row, column)
    @row, @column = row, column
    @links = {}
  end

  def link(cell, bidi = true)
    @links[cell] = true
    cell.link(self, false) if bidi
    self
  end

  def unlink(cell, bidi = true)
    @links.delete(cell)
    cell.unlink(self, false) if bidi
    self
  end

  def unlink_all
    @links = {}
  end

  def links
    @links.keys
  end

  def linked?(cell)
    @links.key?(cell)
  end

  def neighbors
    list = []
    list << north if north
    list << south if south
    list << east if east
    list << west if west
    list
  end

  def background_color_for(distance, maximum)
    intensity = (maximum - distance).to_f / maximum
    dark = intensity.round(3)
    bright = ((128 + (127 * intensity)) / 255).round(3)

    return Ruby2D::Color.new([dark, bright, dark, 1])
  end

  def distances(is_ruby2d = false)
    distances = Distances.new(self)
    frontier = [self]

    if is_ruby2d
      tick = 0

      Ruby2D::Window.update do
        if tick % 60 == 0 and frontier.any?
          new_frontier = []

          frontier.each do |cell|
            cell.links.each do |linked|
              next if distances[linked]
              distances[linked] = distances[cell] + 1
              linked.square.color = background_color_for(distances[linked], 150)

              new_frontier << linked
            end
          end
          frontier = new_frontier
        end
        tick += 10
      end
    else
      while frontier.any?
        new_frontier = []

        frontier.each do |cell|
          cell.links.each do |linked|
            next if distances[linked]
            distances[linked] = distances[cell] + 1
            new_frontier << linked
          end
        end
        frontier = new_frontier
      end
    end
    return distances
  end
end
