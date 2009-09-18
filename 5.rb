#!/usr/bin/env ruby
#
# Problem 5
# 30 November 2001
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

covering_factors = [ 2, 3, 2, 5, 7, 2, 3, 11, 13, 2, 17, 19 ]
puts covering_factors.inject(1) {|prod,f| prod * f}
