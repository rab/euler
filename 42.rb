# -*- coding: utf-8 -*-
# Problem 42
# 25 April 2003
#
# The nth term of the sequence of triangle numbers is given by, tn = ½*n*(n+1);
# so the first ten triangle numbers are:
#
#     1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word
# value is a triangle number then we shall call the word a triangle word.
#
# Using words_42.txt, a 16K text file containing nearly two-thousand common
# English words, how many are triangle words?

require '../ext/enumerable'
require 'string_score'

raise "'SKY' is not 55!" unless 55=='SKY'.score

class Integer
  def triangle
    (self * (self + 1)) / 2
  end
end

triangles = (1..20).map{|i|i.triangle}

words = File.read('words_42.txt').chomp.split(',').map{|n|n.gsub(/"/,'')}

num_triangle_words = 0
words.each do |word|
  s = word.score
  until triangles[-1] > s
    triangles << (triangles.size + 1).triangle
  end
  num_triangle_words += 1 if triangles.include?(s)
end

puts num_triangle_words

# 162

# real	0m0.118s
# user	0m0.090s
# sys	0m0.006s
