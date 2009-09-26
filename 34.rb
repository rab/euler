# Problem 34
# 03 January 2003
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of
# their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

####################
# irb> (0..9).map{|i| i**5}
# => [0, 1, 32, 243, 1024, 3125, 7776, 16807, 32768, 59049]
#
# Since 4**5 = 1024, all such numbers must be at least that large.
# Any number that is less than the 5th power of its largest digit is out.

require 'factorial'

addends = (0..9).map{|i| i.factorial}
total = 0
3.upto(1_000_000) do |n|
  digits = n.to_s.split(//).map{|c|c.to_i}.sort
  next if n < addends[digits[-1]]
  if n == digits.inject(0) {|sum,digit| sum + addends[digit]}
    puts "+%6d"%n
    total += n
  end
end
puts "= #{total}"
# +   145
# + 40585
# = 40730

# real	0m27.191s
# user	0m27.038s
# sys	0m0.097s
