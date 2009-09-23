# Problem 23
# 02 August 2002
#
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
# number.
#
# A number n is called deficient if the sum of its proper divisors is less
# than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

require 'primes'
class Integer
  def abundant?
    ::Prime.sigma(self) > self*2
  end
end

#puts "*stupid brute-force warning*"
limit = 28123
abundants = (1..limit).select {|i| i.abundant? }
sums = {}
abundants.size.times do |a|
  abundants.size.times do |b|
    s = abundants.values_at(a,b).sum
    sums[s] = true
    break if s > limit
  end
end

sum = 0
1.upto(limit) do |n|
  sum += n unless sums[n]
end

puts sum

# really should find all abundant numbers (with Primes.sigma) up to 28123 and
# generate all pairwise sums to subtract from (n*(n+1))/2 when less than
# 28123.

# 4179871

# real	6m43.389s
# user	6m34.535s
# sys	0m2.862s
