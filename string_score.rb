class String
  def score
    split('').map{|c|c.downcase.ord - 'a'.ord + 1}.sum
  end

  # Future-proof by adding an #ord method to return the integral value of a
  # string (the first character).
  unless instance_methods.include?('ord') # Ruby 2.0
    def ord
      unless size == 1
        raise TypeError, "expected a characer, but string of size %ld given" % size
      end

      self[0]                   # Ruby 1.8
    end
  end
end
