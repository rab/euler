class Integer
  def factorial
    if self == 1 || self == 2
      self
    else
      self * (self-1).factorial
    end
  end
end
