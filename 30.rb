# Problem 30
# 08 November 2002
#
# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.

####################
# irb> (0..9).map{|i| i**5}
# => [0, 1, 32, 243, 1024, 3125, 7776, 16807, 32768, 59049]
#
# Since 4**5 = 1024, all such numbers must be at least that large.
# Any number that is less than the 5th power of its largest digit is out.

addends = (0..9).map{|i| i**5}
total = 0
1024.upto(1_000_000) do |n|
  digits = n.to_s.split(//).map{|c|c.to_i}.sort
  next if n < addends[digits[-1]]
  if n == digits.inject(0) {|sum,digit| sum + addends[digit]}
    puts "+%6d"%n
    total += n
  end
end
puts "= #{total}"
# +  4150
# +  4151
# + 54748
# + 92727
# + 93084
# +194979
# = 443839

# real	0m28.001s
# user	0m27.896s
# sys	0m0.077s
