# Problem 17
# 17 May 2002
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.

require '../ext/enumerable'
class Integer
  def british
    case self
    when 0..9
      %w[ zero one two three four five six seven eight nine ][self]
    when 10..19
      %w[ ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen ][self-10]
    when 20..99
      tens, ones = self.divmod(10)
      result = %w[ nil nil twenty thirty forty fifty sixty seventy eighty ninety ][tens]
      result << "-#{ones.british}" unless ones.zero?
      result
    when 100..999
      hundreds, cents = self.divmod(100)
      result = "#{hundreds.british} hundred"
      result << " and #{cents.british}" unless cents.zero?
      result
    when 1000
      'one thousand'
    end
  end
end

puts (1..1000).map { |i| i.british.count 'a-z' }.sum

# 21124

# real	0m0.099s
# user	0m0.040s
# sys	0m0.014s
