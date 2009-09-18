#!/usr/bin/ruby -w
#
# Problem 10
# 08 February 2002
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

puts 'Sieve is more efficient than Prime for primes of known size'

require 'sieve'

puts Sieve.upto(2_000_000).inject(0) {|p,sum|sum+p}

# require 'primes'
# puts  Prime.to(2_000_000).inject(0) {|p,sum|sum+p}

  # require 'mathn'
  # primes = Prime.new
  # sum = 0
  # while (p = primes.next) < 2_000_000
  #   sum += p
  # end
  # puts sum

__END__
if $0 == __FILE__
  require 'test/unit'

  class Euler10Test < Test::Unit::TestCase
    def test_sum_under_10
      expected = 17
      actual = 0
      primes = Prime.new
      while (p = primes.next) < 10
        actual += p
      end
      assert_equal expected, actual
    end
  end
end
