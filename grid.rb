# typed: true
require "cell"
require "chunky_png/color"
require "victor"

class Grid
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns

    @grid = prepare_grid
    configure_cells
  end

  def prepare_grid
    Array.new(rows) do |row|
      Array.new(columns) { |column| Cell.new(row, column) }
    end
  end

  def configure_cells
    each_cell do |cell|
      row, col = cell.row, cell.column

      cell.north = self[row - 1, col]
      cell.south = self[row + 1, col]
      cell.east = self[row, col + 1]
      cell.west = self[row, col - 1]
    end
  end

  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @grid[row].count - 1)
    @grid[row][column]
  end

  def random_cell
    row = rand(@rows)
    column = rand(@grid[row].count)

    self[row, column]
  end

  def size
    @rows * @columns
  end

  def each_row
    @grid.each { |row| yield row }
  end

  def each_cell
    each_row { |row| row.each { |cell| yield cell if cell } }
  end

  def to_s
    output = "+" + "---+" * columns + "\n"
    each_row do |row|
      top = "|"
      bottom = "+"
      row.each do |cell|
        cell = Cell.new(-1, -1) unless cell
        body = "   "

        east_boundary = (cell.linked?(cell.east) ? " " : "|")
        top << body << east_boundary

        south_boundary = (cell.linked?(cell.south) ? "   " : "---")

        corner = "+"
        bottom << south_boundary << corner
      end
      output << top << "\n"
      output << bottom << "\n"
    end
    output
  end

  def to_png(cell_size: 10)
    img_width = cell_size * columns
    img_height = cell_size * rows

    background = ChunkyPNG::Color::WHITE
    wall = ChunkyPNG::Color::BLACK

    img = ChunkyPNG::Image.new(img_width + 1, img_height + 1, background)

    each_cell do |cell|
      x1 = cell.column * cell_size
      y1 = cell.row * cell_size

      x2 = (cell.column + 1) * cell_size
      y2 = (cell.row + 1) * cell_size

      img.line(x1, y1, x2, y1, wall) unless cell.north
      img.line(x1, y1, x1, y2, wall) unless cell.west
      img.line(x2, y1, x2, y2, wall) unless cell.linked?(cell.east)
      img.line(x1, y2, x2, y2, wall) unless cell.linked?(cell.south)
    end

    img
  end

  def to_svg(cell_size: 10)
    img_width = cell_size * columns
    img_height = cell_size * rows

    svg = Victor::SVG.new(width: img_width, height: img_height)

    style = { stroke: "red", stroke_width: 1 }
    each_cell do |cell|
      x1 = cell.column * cell_size
      y1 = cell.row * cell_size

      x2 = (cell.column + 1) * cell_size
      y2 = (cell.row + 1) * cell_size

      svg.line x1: x1, y1: y1, x2: x2, y2: y1, style: style unless cell.north
      svg.line x1: x1, y1: y1, x2: x1, y2: y2, style: style unless cell.west
      unless cell.linked?(cell.east)
        svg.line x1: x2, y1: y1, x2: x2, y2: y2, style: style
      end
      unless cell.linked?(cell.south)
        svg.line x1: x1, y1: y2, x2: x2, y2: y2, style: style
      end
    end
    svg
  end
end
