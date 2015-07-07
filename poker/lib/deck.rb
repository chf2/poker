require_relative 'card.rb'

class Deck
  attr_reader :cards

  def initialize
    @cards = get_new_cards
    p "HELLO"
  end

  def re_shuffle
    until @cards.empty?
      @cards.pop
    end

    @cards = get_new_cards
  end

  def deal(n)
    raise RuntimeError.new if @cards.empty?
    @cards.pop(n)
  end

  private

  def get_new_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        cards << Card.new(suit,rank)
      end
    end
    p cards
    cards.shuffle
  end

end
