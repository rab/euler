#!/usr/bin/ruby -w
#
# Problem 28
# 11 October 2002
#
# Starting with the number 1 and moving to the right in a clockwise direction
# a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?

class Integer
  # 1 => [1]
  # 3 => [3,5,7,9]
  # 5 => [13,17,21,25]
  def corners
    raise "Only valid if odd" unless odd?
    return [1] if self == 1
    result = []
    square = self * self
    4.times {|i| result << (square - i*(self-1)) }
    result
  end
  def odd?
    self & 1 == 1
  end
end

sum = 0
1.step(1001,2) do |sz|
  sum = sz.corners.inject(sum) {|s,e|s+e}
end
puts sum

# 669171001

# real	0m0.012s
# user	0m0.008s
# sys	0m0.003s
