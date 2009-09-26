class Integer
  def ifactorial
    return 1 if self == 0 || self == 1
    result = 1
    f = self
    while f > 1
      result *= f
      f -= 1
    end
    result
  end

  # should be memoized and then recursive is OK
  # (Or the closed form of course.)
  def factorial
    if self == 0 || self == 1
      1
    else
      self * (self-1).factorial
    end
  end
end
