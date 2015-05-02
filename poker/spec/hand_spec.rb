require 'hand.rb'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new([Card.new(:spades, 10),
                             Card.new(:hearts, 4),
                             Card.new(:diamonds, 8),
                             Card.new(:clubs, 7),
                             Card.new(:clubs, 10)]) }

  it "should be 5 cards in length" do
    expect(hand.cards.count).to eq(5)
  end

  it "has cards passed into it" do
    expect(hand.cards).to eq([Card.new(:spades, 10),
                              Card.new(:hearts, 4),
                              Card.new(:diamonds, 8),
                              Card.new(:clubs, 7),
                              Card.new(:clubs, 10)])
  end

  describe "#best_hand" do
    it "returns the best hand" do
      hand.cards = [Card.new(:spades, 10),
                    Card.new(:hearts, 4),
                    Card.new(:diamonds, 8),
                    Card.new(:clubs, 7),
                    Card.new(:clubs, 10)]
      expect(hand.best_hand).to eq([:one_pair, 10])
    end

    it "returns the best hand" do
      hand.cards = [Card.new(:spades, :Q),
                    Card.new(:hearts, :J),
                    Card.new(:diamonds, 10),
                    Card.new(:clubs, 9),
                    Card.new(:clubs, 8)]
      expect(hand.best_hand).to eq([:straight, 12])
    end

    it "returns the best hand" do
      hand.cards = [Card.new(:spades, :Q),
                    Card.new(:spades, :J),
                    Card.new(:spades, 10),
                    Card.new(:spades, 9),
                    Card.new(:spades, 8)]
      expect(hand.best_hand).to eq([:straight_flush, 12])
    end
  end

  describe "#beats_hand?" do
    let(:pair_hand) { Hand.new([Card.new(:spades, :Q),
                                Card.new(:hearts, :J),
                                Card.new(:diamonds, 10),
                                Card.new(:clubs, 9),
                                Card.new(:clubs, 8)]) }
    let(:straight_hand) { Hand.new([Card.new(:spades, :Q),
                                    Card.new(:hearts, :J),
                                    Card.new(:diamonds, 10),
                                    Card.new(:clubs, 9),
                                    Card.new(:clubs, 8)]) }

    it "returns winner" do
      expect(pair_hand.beats_hand?(straight_hand)).to be false
    end
  end
end
