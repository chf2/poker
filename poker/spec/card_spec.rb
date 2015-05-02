require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) {Card.new(:clubs, 10)}
  let(:low_card) {Card.new(:diamonds, 2)}
  let(:high_card) {Card.new(:spades, :A)}
  let(:same_card) {Card.new(:hearts, 10)}

  it "has a suit" do
    expect(card.suit).to eq(:clubs)
  end

  it "has a rank" do
    expect(card.rank).to eq(10)
  end

  it "can compare itself to other cards" do
    expect(high_card > low_card).to be true
  end

  it "is equal to other cards of different suit" do
    expect(card == same_card).to be true
  end
end
