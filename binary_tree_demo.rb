# typed: strict
require "grid"
require "binary_tree"
grid = Grid.new(25, 25)
BinaryTree.on(grid)

#srb rbi updateputs grid
# img = grid.to_png

# img.save "maze.png"

svg = grid.to_svg
svg.save "maze"
