require 'sieve'
require '../ext/enumerable'
class Prime
  # print "Initializing primes to 1_000_000 ... "
  # start = Time.now.to_i
  @@primes = Sieve.upto(1_000_000)
  # puts "%d:%02d"%[*((Time.now.to_i - start).divmod(60))]
  ## is about 2 sec. for primes under 1e6

  def self.upto(n)
    return if @@primes[-1] >= n
    @@primes[-1].step(n, 2) do |p|
      @@primes << p unless @@primes.any?{|f| p%f == 0}
    end
  end

  def self.to(x)
    upto(x)
    @@primes.select{|p| p <= x}
  end

  def self.test?(n)
    upto(n)
    @@primes.include?(n)
  end

  def self.factorize(n)
    factors = []
    limit = Math.sqrt(n).ceil
    to(limit).each do |f|
      while n%f == 0
        factors << f
        n /= f
      end
    end
    factors << n unless n == 1
    factors
  end

  def self.divisors(n,exclude_self=nil)
    factors = factorize(n)
    d=[]
    (2**(factors.size)).times do |x|
      d << factors.map_with_index {|e,i| e**x[i]}.product
    end
    d = d.uniq.sort
    d.pop if exclude_self
    d
  end
end
