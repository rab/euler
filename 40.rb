#!/usr/bin/ruby -w
#
# Problem 40
# 28 March 2003
#
# An irrational decimal fraction is created by concatenating the positive
# integers:
#
# 0.12345678910_1_112131415161718192021...
#
# It can be seen that the _12th_ digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

recent = ''
total_digits = 0
next_natural = 1
d_to_10e = []
interesting = 10**(d_to_10e.size)
while total_digits < 1_000_000
  recent = next_natural.to_s
  next_natural += 1
  if total_digits + recent.size >= interesting
    d_to_10e << recent[interesting - total_digits - 1, 1].to_i
    interesting = 10**(d_to_10e.size)
  end
  total_digits += recent.size
end
p d_to_10e
puts d_to_10e.inject(1){|prod,t|prod*t}

# [1, 1, 5, 3, 7, 2, 1]
# 210

# real	0m0.372s
# user	0m0.351s
# sys	0m0.005s
