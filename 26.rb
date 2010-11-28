# Problem 26
# 13 September 2002

# A unit fraction contains 1 in the numerator. The decimal representation of
# the unit fractions with denominators 2 to 10 are given:

# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.

largest_cycle = [1,0]
(2...1000).each do |d|
  cycles = {}
  num = 10
  digits = []
  catch (:found) {
    until num.zero?
      while d > num
        num *= 10
        digits << 0
      end
      q, r = num.divmod d
      digits << q
      if cycles[num]
        l = digits.length - cycles[num]
        puts "1/%d => 0.%s(%s)  %d"%[d,
                                     digits[0, l].join,
                                     digits[(digits.length - l)..-1].join,
                                     l,
                                    ]
        largest_cycle = [d,l] if l > largest_cycle[1]
        throw :found
      end
      throw :found if r.zero?
      cycles[num] = digits.length
      num = r * 10
    end
  }
end

puts "Largest cycle from %d (length %d)"%largest_cycle

__END__
Largest cycle from 983 (length 982)

real	0m0.430s
user	0m0.310s
sys	0m0.028s

