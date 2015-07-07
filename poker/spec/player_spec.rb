require 'rspec'
require 'player.rb'
require 'hand.rb'

describe Player do 
  subject(:player) { Player.new(10000) }

  it "player initializes with hand and pot" do 
    expect { player.get_discards }.to_not raise_error
    expect(player.pot).to eq(10000)
  end

  describe "#get_discards" do 
    it "calls a method for discarding" do 
      expect { player.get_discards }.to_not raise_error
    end
  end

  describe "#get_move" do 
    it "calls a method to get move" do
      expect { player.get_move(0) }.to_not raise_error
    end
  end

end