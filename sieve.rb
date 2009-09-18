class Sieve
  def self.upto(n)
    numbers = (0..n).to_a
    numbers[0] = numbers[1] = nil
    min_index = 2
    while min_index < n
      (min_index*2).step(n, min_index) {|i| numbers[i] = nil }
      min_index += 1
      min_index += 1 while min_index < n && numbers[min_index].nil?
    end
    numbers.compact
  end
end

if $0 == __FILE__
  require 'test/unit'

  class SieveTest < Test::Unit::TestCase
    def test_upto_10
      expected = [ 2, 3, 5, 7 ]
      assert_equal expected, Sieve.upto(10)
    end
  end
end
