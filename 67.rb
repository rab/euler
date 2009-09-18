#!/usr/bin/ruby -w
#
# NOTE: This is hard-linked to both 18.rb and 67.rb

# Problem 18
# 31 May 2002
#
# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.
#
#    3
#   7 4
#  2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:
#
#               75             (see file: triangle_18.txt)
#              95 64
#             17 47 82
#            18 35 87 10
#           20 04 82 47 65
#          19 01 23 75 03 34
#         88 02 77 73 07 63 67
#        99 65 04 28 06 16 70 92
#       41 41 26 56 83 40 80 70 33
#      41 48 72 33 47 32 37 16 94 29
#     53 71 44 65 25 43 91 52 97 51 14
#    70 11 33 28 77 73 17 78 39 68 17 57
#   91 71 52 38 17 14 91 43 58 50 27 29 48
#  63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
# NOTE: As there are only 16384 routes, it is possible to solve this problem
# by trying every route. However, Problem 67, is the same challenge with a
# triangle containing one-hundred rows; it cannot be solved by brute force,
# and requires a clever method! ;o)

# Problem 67
# 09 April 2004
#
# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.
#
#    3
#   7 4
#  2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in triangle_67.txt, a 15K text
# file containing a triangle with one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not
# possible to try every route to solve this problem, as there are 299
# altogether! If you could check one trillion (1012) routes every second it
# would take over twenty billion years to check them all. There is an
# efficient algorithm to solve it. ;o)

triangle_file = "triangle_#{File.basename(__FILE__, '.rb')}.txt"

triangle = []
File.foreach(triangle_file) do |layer|
  triangle << layer.split.map{|n|n.to_i}
end

while triangle.size > 1
  (row = triangle[-2]).each_with_index do |val, i|
    row[i] += triangle[-1][i,2].max
  end
  triangle.pop
end
puts triangle[0][0]
