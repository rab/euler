class Integer
  def is_prime?
    if self == 1
      false
    elsif self < 4              # 2 or 3
      true
    elsif self & 1 == 0         # even? (multiples of 2)
      false
    elsif self < 9              # already excluded 4, 6, and 8
      true
    elsif self%3==0             # multiples of 3
      false
    else                        # all primes are 6k-1 or 6k+1 for some non-negative integer k
      r=Math.sqrt(self).floor
      f=5                       # start with 6k-1
      while f<=r
        if self%f==0
          return false
        elsif self%(f+2)==0
          return false
        end
        f+=6
      end
      true
    end
  end
end
