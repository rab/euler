#!/usr/bin/ruby -w
#
# Problem 32
# 06 December 2002
#
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.

puts "quick answer is a hack on the original brute-force result"
puts [4396, 5346, 5796, 6952, 7254, 7632, 7852].inject(0){|s,i| s + i}
__END__
require 'rubygems'
require 'permutation'

class NilClass
  # quack like a String
  def empty?
    true
  end
end

puts "slow and hackish..."

pandigital = {}
perm = Permutation.for('123456789*=')
perm.each! do |p|
  a, r = (s=p.project).split('*',2)
  b, c = r.split('=',2)
  next if a.empty? || b.empty? || c.empty?
  a, b, c = [a,b,c].map{|x|x.to_i}
  next unless a*b==c
  prod = [a,b].sort.join('*')
  next if pandigital.has_key?(c)
  pandigital[c] = prod
  puts s
  break unless s[0,1] == '1'    # hack!
end
print pandigital.inject(0) {|(k,p),sum| sum+p}
