require 'factorial'
class Integer
  def catalan
    (2*self).factorial / ((1+self).factorial * self.factorial)
  end
end
