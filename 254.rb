# Problem 254
# 04 September 2009
#
# Define f(n) as the sum of the factorials of the digits of n.
# For example, f(342) = 3! + 4! + 2! = 32.
#
# Define sf(n) as the sum of the digits of f(n). So sf(342) = 3 + 2 = 5.
#
# Define g(i) to be the smallest positive integer n such
# that sf(n) = i. Though sf(342) is 5, sf(25) is also 5, and it can be
# verified that g(5) is 25.
#
# Define sg(i) as the sum of the digits of g(i). So sg(5) = 2 + 5 = 7.
#
# Further, it can be verified that g(20) is 267 and SIGMA[sg(i)] for 1 <= i <= 20 is 156.
#
# What is SIGMA[sg(i)] for 1 <= i <= 150?

####################
# Verifies SIGMA[sg(1..20)] is
# 156

# real	0m0.024s
# user	0m0.017s
# sys	0m0.006s

# quickly! BUT...

require 'factorial'
require 'set'

puts "** brute-force gets 1..44 in about 2 minutes **"
puts "** (and gets to 10 min. w/o any other value) **"

addends = (0..9).map {|i| i.factorial}

m = 20 # 150
still_need = Set.new(1..m)
g = Hash.new
n = 1
loop do
  f = n.to_s.split(//).map{|c|c.to_i}.inject(0) {|sum,digit| sum + addends[digit]}
  sf = f.to_s.split(//).inject(0) {|sum,char| sum + char.to_i}
  unless g.has_key?(sf)
    puts "#{Time.now}: g(#{sf}) => #{n}"
    g[sf] = n
    still_need.delete(sf)
    break if still_need.empty?
  end
  n += 1
end

puts g.sort.inspect
puts (1..m).inject(0) {|sum,value| sum + g[value].to_s.split(//).inject(0) {|sg,char| sg + char.to_i} }
