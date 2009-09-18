#!/usr/bin/ruby -w
#
# Problem 3
# 02 November 2001
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

c = 600851475143

require 'primes'

puts Prime.factorize(c).max
