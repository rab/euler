#!/usr/bin/ruby -w
#
# Problem 21
# 05 July 2002
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require 'primes'
require '../ext/enumerable'
class Integer
  def d
    Prime.divisors(self,true).sum
  end
end

$stdout.sync = true
amicable = []
nope = []
10_000.times do |a|
  next if Prime.test?(a) || amicable.include?(a) || nope.include?(a)
  print '.' if a%100==0
  b = a.d
  next if b == a
  if a == b.d
    amicable.concat([a,b])
  else
    nope << b
  end
end

p amicable.sort
puts amicable.sum
# .............................................................................[220, 284, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368]
# 31626

# real	9m25.230s
# user	9m12.743s
# sys	0m4.016s
