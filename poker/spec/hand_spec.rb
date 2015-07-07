require 'hand.rb'
require 'rspec'

describe Hand do
  let(:card1) { double('card1', :suit => :spades, :rank => 10 ) }
  let(:card2) { double('card2', :suit => :hearts, :rank => 4 ) }
  let(:card3) { double('card3', :suit => :spades, :rank => 8 ) }
  let(:card4) { double('card4', :suit => :clubs, :rank => 7 ) }
  let(:card5) { double('card5', :suit => :clubs, :rank => 10 ) }
  let(:card6) { double('card1', :suit => :spades, :rank => 12 ) }
  let(:card7) { double('card2', :suit => :hearts, :rank => 11 ) }
  let(:card8) { double('card3', :suit => :diamonds, :rank => 10 ) }
  let(:card9) { double('card4', :suit => :clubs, :rank => 9 ) }
  let(:card10) { double('card1', :suit => :spades, :rank => 9 ) }
  let(:card11) { double('card1', :suit => :spades, :rank => 11 ) }
  subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }

  it "should be 5 cards in length" do
    expect(hand.cards.count).to eq(5)
  end

  it "has cards passed into it" do
    expect(hand.cards).to eq([card1, card2, card3, card4, card5])
  end

  describe "#best_hand" do
    it "returns the best hand" do
      hand.cards = [card1, card2, card3, card4, card5]
      expect(hand.best_hand).to eq([:one_pair, 10])
    end

    it "returns the best hand" do
      hand.cards = [card3, card6, card7, card8, card9]
      expect(hand.best_hand).to eq([:straight, 12])
    end

    it "returns the best hand" do
      hand.cards = [card1, card3, card6, card10, card11]
      expect(hand.best_hand).to eq([:straight_flush, 12])
    end
  end

  describe "#beats_hand?" do
    let(:pair_hand) { Hand.new([card1, card2, card3, card4, card5]) }
    let(:straight_hand) { Hand.new([card3, card6, card7, card8, card9]) }

    it "returns winner" do
      expect(pair_hand.beats_hand?(straight_hand)).to be false
    end
  end

  describe "#discard" do 
    it "discards the right cards" do 
      hand.discard(1, 2, 3)
      expect(hand.cards).to eq([card1, card5])
    end
  end
end
