#!/usr/bin/ruby -w
#
# Problem 35
# 17 January 2003
#
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes
# below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

require 'sieve'
require '../ext/enumerable'

all_primes = {}
Sieve.upto(1_000_000).each {|prime| all_primes[prime] = nil}
circular = []
all_primes.keys.each do |a_prime|
  next if all_primes[a_prime]
  cycles = []
  digits = a_prime.to_s.split('')
  digits.each_cycle(digits.size) {|d| cycles << d.join.to_i}
  if cycles.all? {|c| all_primes.has_key?(c)}
    cycles.each {|x| circular << x; all_primes[x] = true}
  end
end
puts "uh, yeah there were dups" unless circular.uniq!

p circular

puts circular.size

# [2, 3, 5, 7, 11, 13, 31, 17, 71, 37, 73, 79, 97, 113, 131, 311, 197, 971,
# 719, 199, 991, 919, 337, 373, 733, 99371, 93719, 37199, 71993, 19937, 91193,
# 11939, 19391, 93911, 39119, 9311, 3119, 1193, 1931, 9377, 3779, 7793, 7937,
# 199933, 999331, 993319, 933199, 331999, 319993, 939193, 391939, 919393,
# 193939, 939391, 393919]

# 55

# real	0m21.914s
# user	0m20.899s
# sys	0m0.165s
