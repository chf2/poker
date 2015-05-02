require 'rspec'
require 'deck.rb'

describe Deck do
  subject(:deck) {Deck.new}

  it "has 52 cards" do
    expect(deck.cards.length).to eq(52)
  end

  it "has 13 cards of one suit" do
    expect(deck.cards.count{|card| card.suit == :spades}).to eq(13)
  end

  it "has 4 of one rank of card" do
    expect(deck.cards.count{|card| card.rank == :K}).to eq(4)
  end

  describe "#deal" do
    it "should return the top card of the deck" do
      test_card = deck.cards.last
      expect(deck.deal).to eq(test_card)
    end

    it "should remove the card from the deck" do
      deck.deal
      expect(deck.cards.count).to eq(51)
    end
  end

  describe "#re_shuffle" do
    it "should reset the deck length to 52" do
      deck.deal
      deck.deal
      deck.re_shuffle
      expect(deck.cards.count).to eq(52)
    end
  end
end
