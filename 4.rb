#!/usr/bin/ruby -w
#
# Problem 4
# 16 November 2001
#
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

class Fixnum
  def palindrome?
    s = self.to_s
    s == s.reverse
  end
end

m = 0
900.upto(999) do |a|
  900.upto(999) do |b|
    p = a*b
    m = p if p > m && p.palindrome?
  end
end
puts m
