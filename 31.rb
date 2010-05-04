# -*- coding: utf-8 -*-
# Problem 31
# 22 November 2002
#
# In England the currency is made up of pound, £, and pence, p, and there are
# eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
#
# How many different ways can £2 be made using any number of coins?

####################
# possible use in problem 78 with coins=(1..n).to_a

coins = [1, 2, 5, 10, 20, 50, 100, 200].reverse

# Given a target (200) and a descending array of values (coins), if the
# largest value is still less than the target, sum the values of hitting
# (target-c*value) for all c in 0..(target/c). Inductively, there is a single
# way to hit 0 with [any].

def change_for(target, *values)
  if target == 0
    puts "A: change_for(#{target.inspect}, *#{values.inspect}) => 1"
    1
  elsif values.empty?
    puts "B: change_for(#{target.inspect}, *#{values.inspect}) => 0"
    0
  elsif values.first > target
    x=change_for(target, *values[1..-1])
    puts "C: change_for(#{target.inspect}, *#{values.inspect}) => #{x}"
    x
  else
    results = 0
    value, *rest = values
    (target/value + 1).times do |c|
      results += change_for(target-c*value, *rest)
    end
    puts "D: change_for(#{target.inspect}, *#{values.inspect}) => #{results}"
    results
  end
end

puts change_for(5, 5, 2, 1)
# should be: 4
# 1: 5
# 2: 2+2+1
# 3: 2+1+1+1
# 4: 1+1+1+1+1

#puts change_for(5, 5, 4, 3, 2, 1)
# should be: 7
# 1: 5
# 2: 4+1
# 3: 3+2
# 4: 3+1+1
# 5: 2+2+1
# 6: 2+1+1+1
# 7: 1+1+1+1+1
