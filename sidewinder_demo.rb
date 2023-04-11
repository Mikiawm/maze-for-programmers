# typed: strict
require "grid"
require "sidewinder"

grid = Grid.new(25, 25)
Sidewinder.on(grid)
puts grid
