# Problem 78
# 10 September 2004
#
# Let p(n) represent the number of different ways in which n coins can be
# separated into piles. For example, five coins can separated into piles in
# exactly seven different ways, so p(5)=7.
#
# OOOOO
# OOOO   O
# OOO   OO
# OOO   O   O
# OO   OO   O
# OO   O   O   O
# O   O   O   O   O
#
# Find the least value of n for which p(n) is divisible by one million.

####################
# look at problem 31 for ideas

require 'catalan'

#raise "Not Catalan!" if 5.catalan != 7

class Integer
  def choose(r)
    raise ArgumentError, "nCr not defined if r>n" if r > self
    return 1 if r == self
    (self.ifactorial) / ((self-r).ifactorial * r.ifactorial)
  end
  def partitions
    if self == 1 || self == 2 || self == 3
      self
    else
      p = 0
      1.upto(self/2) do |i|
        p += (self-i).partitions + i.partitions - 1
      end
      p
    end
  end
end

# 7
# 6,1
# 5,2
# 4,3

# 6
# 5,1
# 4,2
# 3,3

# 5
# 4,1
# 3,2

# 4
# 3,1
# 2,2

# 3
# 2,1

# 2
# 1,1

# 1
puts "this is still crap"

require 'test/unit'
class Test78 < Test::Unit::TestCase
  def test_partitions
    { 1 => 1, 2 => 2, 3 => 3, 4 => 5, 5 => 7, 6 => 10, 7 => 14, }.sort.each do |n,p|
      assert_equal p, n.partitions, "p(#{n}) => #{p}"
    end
  end
end
