#!/usr/bin/ruby -w
#
# Problem 22
# 19 July 2002
#
# Using names22.txt, a 46K text file containing over five-thousand first
# names, begin by sorting it into alphabetical order. Then working out the
# alphabetical value for each name, multiply this value by its alphabetical
# position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which
# is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?

require '../ext/enumerable'
require 'string_score'

raise "'COLIN' is not 53!" unless 53=='COLIN'.score

names = File.read('names22.txt').chomp.split(',').map{|n|n.gsub(/"/,'')}.sort

puts names.map_with_index {|name,i| name.score * (i+1)}.sum
