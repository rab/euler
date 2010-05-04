require 'sieve'
begin
  require '../ext/enumerable'
rescue LoadError
  require File.expand_path('../ext/enumerable', File.dirname(__FILE__))
end
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
    upto(limit)
    @@primes.each do |f|
      break if f > limit
      while n%f == 0
        factors << f
        n /= f
      end
    end
    factors << n unless n == 1
    factors
  end

  # Need to incorporate the sigma function
  # http://primes.utm.edu/glossary/xpage/SigmaFunction.html
  # which is the sum of the positive divisors of n
  # sigma(n) == divisors(n).sum

  def self.sigma(n)
    factors = factorize(n)
    factor_exponents = factors.count_by {|f| f}
    factor_exponents.map {|p,n| (p**(n+1) - 1)/(p-1) }.product
  end

  # AH! Actually, I want the tau function
  # http://primes.utm.edu/glossary/xpage/Tau.html
  def self.divisors(n,exclude_self=nil)
    factors = factorize(n)
    tau_exponents = Hash.new {|h,k| h[k]=1}
    factors.each {|f| tau_exponents[f] += 1}
    tau = tau_exponents.values.product
    if exclude_self
      tau - 1
    else
      tau
    end
  end
end
