require_relative 'card'

class Hand
  HANDS = [:straight_flush, :four_of_a_kind, :full_house, :flush,
                :straight, :three_of_a_kind, :two_pair, :one_pair, :high_card]
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def best_hand
    HANDS.each do |hand|
      return [hand, self.send(hand)] if self.send(hand)
    end
  end

  def beats_hand?(other_hand)
    other_best_hand = other_hand.best_hand
    if HANDS.index(best_hand[0]) < HANDS.index(other_best_hand[0])
      true
    elsif HANDS.index(best_hand[0]) > HANDS.index(other_best_hand[0])
      false
    elsif HANDS.index(best_hand[0]) == HANDS.index(other_best_hand[0])
      best_hand[1] > best_hand[1]
    end
  end

  def discard(*card_index)
    leftover_cards = []
    @cards.each_with_index do |card, index|
      leftover_cards << card unless card_index.include?(index)
    end
    @cards = leftover_cards
  end

  private

  def one_pair
    rank = nil
    ranks = @cards.map{ |card| card.rank }
    @cards.each do |card|
      rank = card.rank if ranks.count(card.rank) == 2
    end
    rank
  end

  def three_of_a_kind
    rank = nil
    @cards.each do |card|
      rank = card.rank if @cards.count(card.rank) == 3
    end
    rank
  end

  def four_of_a_kind
    rank = nil
    @cards.each do |card|
      rank = card.rank if @cards.count(card.rank) == 4
    end
    rank
  end

  def high_card
    @cards.map{ |card| card.rank }.max
  end

  def flush
    if @cards.all? {|card| card.suit == @cards.first.suit}
      @cards.map{ |card| card.rank }.max
    else
      nil
    end
  end

  def full_house
    ranks = @cards.map { |card| card.rank }
    if ranks.uniq.size == 2
      if ranks.count(ranks.first).between?(2, 3)
        return ranks.max
      end
    end
    nil
  end

  def two_pair
    ranks = @cards.map {|card| card.rank }.sort
    pairs = []
    ranks.each do |el|
      pairs << el if ranks.count(el) == 2
    end
    pairs.length == 4 ? ranks.last : nil
  end

  def straight
    ranks = @cards.map { |card| card.rank }.sort!
    ranks.size.times do |idx|
      next if idx + 1 == ranks.size
      return nil unless ranks[idx+1] == ranks[idx] + 1
    end
    ranks.last
  end

  def straight_flush
    flush && straight ? flush : nil
  end

end
