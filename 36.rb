# Problem 36
# 31 January 2003
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require '../ext/enumerable'
class String
  def palindrome?
    self == self.reverse
  end
end

found = []
1.step(1_000_000, 2) do |n|
  d=n.to_s
  next unless d[0,1] =~ /[13579]/
  found << n if d.palindrome? && n.to_s(2).palindrome?
end
p found
puts found.sum

# [1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]
# 872187

# real	0m1.577s
# user	0m1.552s
# sys	0m0.015s

# The binary palindrome requirement means that the number must be odd in
# decimal. A bit more analysis would further reduce the possible palindrome
# patterns, but at <2sec it just isn't worth it.
