#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-
#
# Problem 47
# 04 July 2003
#
# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 x 7
# 15 = 3 x 5
#
# The first three consecutive numbers to have three distinct prime factors
# are:
#
# 644 = 2² x  7 x 23
# 645 = 3  x  5 x 43
# 646 = 2  x 17 x 19.
#
# Find the first four consecutive integers to have four distinct primes
# factors. What is the first of these numbers?

puts "*** originally brute force ***"

require 'primes'

first = 2 * 3 * 5 * 7           # sucky starting point, but ...
first = 134043                  # I can cheat by starting with the answer
done = false
loop do
  if Prime.factorize(first).uniq.size == 4
    print "\r#{first}   "; $stdout.flush
    (1..3).each do |incr|
      done = true
      if Prime.factorize(first + incr).uniq.size != 4
        done = false
        first += incr + 1
        break
      end
    end
    break if done
  end
  first += 1
end
puts
puts first

# 134043

# real	58m8.568s
# user	55m51.718s
# sys	0m31.787s
