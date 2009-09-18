#!/usr/bin/ruby -w
#
# Problem 15
# 19 April 2002
#
# Starting in the top left corner of a 2x2 grid, there are 6 routes (without
# backtracking) to the bottom right corner.
#
# How many routes are there through a 20x20 grid?

require 'grid'

grid = Grid.new(20, 20)

grid[0][0] = 1
grid.cover do |r,c|
  grid[r][c] = (r > 0 ? grid[r-1][c] : 1) + (c > 0 ? grid[r][c-1] : 1)
end
puts grid[-1][-1]
