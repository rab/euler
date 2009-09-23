require 'test/unit'
require 'primes'
class PrimeTest < Test::Unit::TestCase
  def test_tau
    tau_of ={ 1=>1, 2=>2, 3=>2, 4=>3, 5=>2, 6=>4, 7=>2, 8=>4, 9=>3, 10=>4, 11=>2, 12=>6, 13=>2, 14=>4, 15=>4, 16=>5 }
    tau_of.each do |n,tau|
      assert_equal tau, Prime.divisors(n), "tau(#{n}) => #{tau}"
    end
  end
end
