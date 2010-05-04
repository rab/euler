# really ought to be a singleton

class Fibs
  def initialize(first=0, second=1)
    @fibs = [ first, second ]
    @limit = 2
  end

  def [](n)
    raise ArgumentError, "must be a natural number" unless n > 0
    next_fib while @limit < n
    @fibs[n-1]
  end

  private
  def next_fib
    @fibs << @fibs[-2] + @fibs[-1]
    @limit += 1
  end
end

Math.class_eval do
  SQRT5 = Math.sqrt(5)
  def self.fib(n)
    (((1+SQRT5)**n - (1-SQRT5)**n)/(2**n * SQRT5)).to_i
  end
end
