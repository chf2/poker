class Card
  include Comparable
  attr_reader :suit, :rank

  SUITS = [:clubs, :hearts, :spades, :diamonds]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]


  def initialize(suit, rank)
    @suit, @rank = suit, rank
  end

  def rank
    return @rank if @rank.is_a?(Fixnum)
    decoder = {J: 11, Q: 12, K: 13, A: 14}
    decoder[@rank]
  end

  def <=>(other_card)
    rank <=> other_card.rank
  end

  def ranks
    RANKS
  end

  def suits
    SUITS
  end
end
