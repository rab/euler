# Problem 54
# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:

# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

# If two players have the same ranked hands then the rank made up of the
# highest value wins; for example, a pair of eights beats a pair of fives (see
# example 1 below). But if two ranks tie, for example, both players have a
# pair of queens, then highest cards in each hand are compared (see example 4
# below); if the highest cards tie then the next highest cards are compared,
# and so on.

# The file, poker.txt, contains one-thousand random hands dealt to two
# players. Each line of the file contains ten cards (separated by a single
# space): the first five are Player 1's cards and the last five are Player 2's
# cards. You can assume that all hands are valid (no invalid characters or
# repeated cards), each player's hand is in no specific order, and in each
# hand there is a clear winner.

# How many hands does Player 1 win?

class Hand
  VALUE = {'2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, 'T'=> 10, 'J'=> 11, 'Q'=> 12, 'K'=> 13, 'A'=> 14,}
  PIP_FOR = VALUE.invert

  def hand
    @hand * ' '
  end

  def initialize(*cards)
    @hand = cards
    @cards = @hand.map{|card| pip, suit = card.split(//); [VALUE[pip], suit] }
  end

  def value
    if suit = royal_flush?
      "Royal Flush (%s)"%[suit]
    elsif high = straight_flush?
      "Straight Flush (%s high)"%[high]
    elsif pip = four_of_a_kind?
      "Four of a Kind %ss"%[pip]
    elsif pips = full_house?
      "Full House (%ss over %ss)"%pips
    elsif suit = flush?
      "Flush (%s)"%[suit]
    elsif high = straight?
      "Straight (%s high)"%[high]
    elsif pip = three_of_a_kind?
      "Three of a Kind %ss"%[pip]
    elsif pips = two_pairs?
      "Two Pairs (%ss & %ss)"%pips
    elsif pip = one_pair?
      "One Pair (%ss)"%[pip]
    elsif pip = high_card?
      "%s High"%[pip]
    else
      "** Oops! No value for "
    end
  end

  def <=>(other)
    my_score = self.score
    other_score = other.score
    (my_score[0] <=> other_score[0]).nonzero? || my_score[1] <=> other_score[1]
  end

  def score
    if suit = royal_flush?
      "Royal Flush (%s)"%[suit]
      [10,suit]
    elsif high = straight_flush?
      "Straight Flush (%s high)"%[high]
      [9,VALUE[high]]
    elsif pip = four_of_a_kind?
      "Four of a Kind %ss"%[pip]
      [8,VALUE[pip]]
    elsif pips = full_house?
      "Full House (%ss over %ss)"%pips
      [7,pips.map{|_|VALUE[_]}]
    elsif suit = flush?
      "Flush (%s)"%[suit]
      [6,suit]
    elsif high = straight?
      "Straight (%s high)"%[high]
      [5,VALUE[high]]
    elsif pip = three_of_a_kind?
      "Three of a Kind %ss"%[pip]
      [4,VALUE[pip]]
    elsif pips = two_pairs?
      "Two Pairs (%ss & %ss)"%pips
      [3,pips.map{|_|VALUE[_]}]
    elsif pip = one_pair?
      "One Pair (%ss)"%[pip]
      [2,VALUE[pip]]
    elsif pip = high_card?
      "%s High"%[pip]
      [1,VALUE[pip]]
    else
      "** Oops! No value for "
      [0,nil]
    end
  end

  # High Card: Highest value card.
  def high_card?
    PIP_FOR[@cards.map{|pip,_|pip}.max]
  end

  # One Pair: Two cards of the same value.
  def one_pair?
    histogram.values.sort == [1,1,1,2] && PIP_FOR[histogram.detect {|pip,count| count == 2 }[0]]
  end

  # Two Pairs: Two different pairs.
  def two_pairs?
    histogram.values.sort == [1,2,2] && histogram.select {|pip,count| count == 2 }.map{|pip,_| PIP_FOR[pip]}
  end

  # Three of a Kind: Three cards of the same value.
  def three_of_a_kind?
    histogram.any? {|pip,count| count == 3 } && histogram.none? {|pip,count| count == 2 } &&
      PIP_FOR[histogram.detect {|pip,count| count == 3 }[0]]
  end

  # Straight: All cards are consecutive values.
  def straight?
    values = @cards.map{|_|_[0]}.sort
    values.map{|_|_ - values[0]} == [0,1,2,3,4] && PIP_FOR[values[-1]]
  end

  # Flush: All cards of the same suit.
  def flush?
    one_suit = @cards[0][1]
    @cards.all? {|_,suit| suit == one_suit } && one_suit
  end

  # Full House: Three of a kind and a pair.
  def full_house?
    histogram.values.sort == [2,3] && histogram.invert.values_at(3,2).map{|_|PIP_FOR[_]}
  end

  # Four of a Kind: Four cards of the same value.
  def four_of_a_kind?
    histogram.any? {|pip,count| count == 4 } && PIP_FOR[@cards.map{|pip,_|pip}.sort[1]]
  end

  # Straight Flush: All cards are consecutive values of same suit.
  def straight_flush?
    straight? && flush? && PIP_FOR[@cards.map{|pip,_|pip}.max]
  end

  # Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
  def royal_flush?
    @cards.map{|_|_[0]}.sort == [10,11,12,13,14] && flush? && @cards.map{|_,suit|suit}.max
  end

  private

  def histogram
    return @histogram unless @histogram.nil?
    @histogram = Hash.new {|h,k| h[k] = 0}
    @cards.each {|pip,suit| @histogram[pip] += 1 }
    @histogram
  end
end

if $0 == __FILE__
  p1wins = 0
  File.foreach('poker.txt') do |line|
    cards = line.split(' ')
    player_1 = Hand.new(*(cards[0,5]))
    player_2 = Hand.new(*(cards[5,5]))

    puts "%30s %s %s %s %s"%[player_1.value, player_1.hand,
                             [' = ', '<= ', ' =>'][player_1 <=> player_2],
                             player_2.hand, player_2.value]

    p1wins += 1 if (player_1 <=> player_2) > 0
  end
  puts "Player 1 wins %d"%p1wins
end

__END__
Player 1 wins 376

real	0m0.428s
user	0m0.415s
sys	0m0.015s
