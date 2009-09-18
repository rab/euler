#!/usr/bin/ruby -w
#
# Problem 7
# 28 December 2001
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
#
# What is the 10001st prime number?

puts "(slow [1.5 minutes], using Ruby's Prime class)"

# require 'mathn'
# primes = Prime.new
# 10000.times { primes.next }
# puts primes.next

#=> 104743

puts 'Quicker using my Sieve'

require 'sieve'

maxguess = 10_000               # this will be wrong, but not too big
loop do
  primes = Sieve.upto(maxguess)
  if primes.size > 10_000
    puts primes[10_000]
    exit
  else
    maxguess *= 10
    puts "get primes up to #{maxguess}"
  end
end
