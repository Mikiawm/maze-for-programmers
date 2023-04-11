# typed: strict
require "grid"
require "binary_tree"
grid = Grid.new(25, 25)
BinaryTree.on(grid)

img = grid.to_png

img.save "maze.png"
