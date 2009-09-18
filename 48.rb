#!/usr/bin/ruby -w
#
# Problem 48
# 18 July 2003
#
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

tt=10**10
puts (1..1000).inject(0){|sum,i| sum + i**i % tt} % tt
#=> 9110846700
