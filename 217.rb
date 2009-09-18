#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# Problem 217
# 14 November 2008
#
# A positive integer with k (decimal) digits is called balanced if its first
# ceiling(k/2) digits sum to the same value as its last ceiling(k/2) digits,
# where ceiling(x), pronounced ceiling of x, is the smallest integer >=x, thus
# ceiling(π) = 4 and ceiling(5) = 5.
#
# So, for example, all palindromes are balanced, as is 13722.
#
# Let T(n) be the sum of all balanced numbers less than 10**n. 
# Thus: T(1) = 45, T(2) = 540 and T(5) = 334795890.
#
# Find T(47) mod 3**15

puts "*** Unsolved ***"
puts "Naive (aka, slow) attempt follows..."

class Integer
  def balanced?
    digits = self.to_s.split(//)
    m = (digits.size / 2.0).ceil

    sum = 0
    (0...m).each {|i| sum += digits[i].to_i}
    (-m..-1).each {|i| sum -= digits[i].to_i}
    sum.zero?
  end
end

def T(n)
  sum = 0
  1.upto(10**n) do |i|
    sum += i if i.balanced?
  end
  sum
end

# completely naïve version takes:
# Waaay toooo lllloooooooooooooong! (actually, I never let it finish)
#puts T(47)%(3**15)

1.upto(5) do |n|
  puts "T(#{n}) == #{T(n)} (#{T(n).to_f / T(n-1)})"
end

if $0 == __FILE__
  require 'test/unit'

  class BalancedTest < Test::Unit::TestCase
    def test_single_digits
      (1..9).each do |n|
        assert n.balanced?, "why not #{n}"
      end
    end

    def test_double_digits
      expected = (1..9).map{|i|i*11}
      assert_equal expected, (10..99).select{|i| i.balanced?}
    end

    [[1, 45], [2, 540], [5, 334795890]].each do |n,t_n|
      define_method "test_T_#{n}" do
        assert_equal t_n, T(n), "T(#{n})"
      end
    end
  end
end

