#!/usr/bin/ruby -w
#
# Problem 149
# 13 April 2007
#
# Looking at the table below, it is easy to verify that the maximum possible
# sum of adjacent numbers in any direction (horizontal, vertical, diagonal or
# anti-diagonal) is 16 (= 8 + 7 + 1).
#
#   -2	 5   3   2
#    9  -6   5   1
#    3	 2   7   3
#   -1	 8  -4   8
# Now, let us repeat the search, but on a much larger scale:
#
# First, generate four million pseudo-random numbers using a specific form of
# what is known as a "Lagged Fibonacci Generator":
#
# For  1 <= k <= 55, s_k = [100_003 - 200_003*k + 300_007*k**3] (modulo 1_000_000) - 500_000.
# For 56 <= k <= 4_000_000, s_k = [s_k-24 + s_k-55 + 1_000_000] (modulo 1_000_000) - 500_000.
#
# Thus, s_10 = -393_027 and s_100 = 86_613.
#
# The terms of s are then arranged in a 2000x2000 table, using the first 2000
# numbers to fill the first row (sequentially), the next 2000 numbers to fill
# the second row, and so on.
#
# Finally, find the greatest sum of (any number of) adjacent entries in any
# direction (horizontal, vertical, diagonal or anti-diagonal).

class LFib
  def initialize
    @s = [nil]
    1.upto(55) do |k|
      @s << (100_003 - 200_003*k + 300_007*k**3)%1_000_000 - 500_000
    end
    56.upto(4_000_000) do |k|
      @s << (@s[k-24] + @s[k-55] + 1_000_000)%1_000_000 - 500_000
    end
  end
  def [](n)
    @s[n]
  end
  def size
    @s.size
  end
end

$s = LFib.new

=begin
require 'test/unit'
class Problem149Test < Test::Unit::TestCase
  def test_size
    assert_equal 4_000_001, $s.size
  end
  def test_s_10
    assert_equal(-393_027, $s[10])
  end
  def test_s_100
    assert_equal(86_613, $s[100])
  end
end
=end
