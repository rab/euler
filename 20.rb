#!/usr/bin/ruby -w
#
# Problem 20
# 21 June 2002
#
# n! means n x (n - 1) x ... x 3 x 2 x 1
#
# Find the sum of the digits in the number 100!

require 'factorial'

puts 100.factorial.to_s.split('').inject(0){|sum,d|sum+d.to_i}
