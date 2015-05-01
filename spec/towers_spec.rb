require 'rspec'
require 'towers.rb'

describe TowersOfHanoi do
  subject(:board) do
    TowersOfHanoi.new
  end

  it "initializes with correct stacks" do
    expect(board.stacks).to eq([[3,2,1],[],[]])
  end

  describe "#move" do
    it "moves the top element of one stack to another" do
      board.move(0, 1)
      expect(board.stacks).to eq([[3,2], [1], []])
    end

    it "leaves stacks unchanged for illegal move" do
      board.move(0, 1)
      board.move(0, 1)
      expect(board.stacks).to eq([[3,2], [1], []])
    end

    it "raises error if move input outside params" do
      expect { board.move(0, 3) }.to raise_error(ArgumentError)
    end

    it "raises error if you try to take piece from empty stack" do
      expect { board.move(1,2) }.to raise_error(ArgumentError)
    end
  end

  describe "#won?" do
    it "returns true for a won board" do
      board.move(0,2)
      board.move(0,1)
      board.move(2,1)
      board.move(0,2)
      board.move(1,0)
      board.move(1,2)
      board.move(0,2)

      expect(board).to be_won
    end

    it "returns false for unfinished board" do
      board.move(0,1)
      board.move(0,2)

      expect(board).to_not be_won
    end

    it "initial position is not winning" do
      expect(board).to_not be_won
    end
  end

  describe "#render" do
    it "renders current board state" do 
      board.move(0, 1)
      expect(board.render).to eq(board.stacks)
    end
  end

end
