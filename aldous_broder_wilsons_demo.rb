require "colored_grid"
require "aldous_broder"
require "wilsons"

grid = Grid.new(20, 20)

6.times do |n|
  grid = ColoredGrid.new(20, 20)
  Wilsons.on(grid)

  middle = grid[grid.rows / 2, grid.columns / 2]
  grid.distances = middle.distances
  filename = "aldous_broder_%02d.png" % n
  grid.to_png.save(filename)
  puts "saved to #{filename}"
end
