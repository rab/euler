#!/usr/bin/ruby -w
#
# Problem 46
# 20 June 2003
#
# It was proposed by Christian Goldbach that every odd composite number can be
# written as the sum of a prime and twice a square.
#
#  9 =  7 + 2*1^2
# 15 =  7 + 2*2^2
# 21 =  3 + 2*3^2
# 25 =  7 + 2*3^2
# 27 = 19 + 2*2^2
# 33 = 31 + 2*1^2
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?

require 'sieve'

primes = Sieve.upto(1_000_000)
prime_hash = Hash.new {|h,k| h[k] = primes.include?(k) }

twice_squares = (1..1000).map{|i| 2*i*i}

9.step(999_999, 2) do |o|
  next if primes.include?(o)
  next if twice_squares.select{|ts| ts < o}.any?{|ts| prime_hash[o-ts]}
  print o
  exit
end

# 5777
# real	0m42.897s
# user	0m37.317s
# sys	0m0.362s
