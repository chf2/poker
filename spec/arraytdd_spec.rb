require 'arraytdd.rb'
require 'rspec'

describe Array do
  describe "#my_uniq" do
    subject(:array) { [1,2,1,3,3]}
    let(:uniq_arr) {[1,2,3]}

    it "removes duplicate elements" do
      expect(array.my_uniq).to contain_exactly(3,2,1)
    end

    it "does not remove already unique elements" do
      expect(uniq_arr.my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    subject(:array) { [-1, 0, 2, -2, 1] }
    it "returns positions where elements sum to zero" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "all individual elements are in order" do
      expect(array.two_sum.all? do |pair|
        pair[0] <= pair[1]
      end).to be true
    end
  end

  describe "#my_transpose" do
    subject(:array) { [[0, 1, 2],
                       [3, 4, 5],
                       [6, 7, 8] ] }


    it "transposes a matrix" do
      expect(array.my_transpose).to eq( [[0, 3, 6],
                                        [1, 4, 7],
                                        [2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    subject(:array) { [6, 5, 4, 3, 6, 12, 10] }
    let(:no_good_pair_array) { [10, 9, 8, 7, 6, 5] }

    it "returns most profitable pair of days" do
      expect(array.stock_picker).to eq([3, 5])
    end

    it "returns nil if can't make a profit" do
      expect(no_good_pair_array.stock_picker).to be_nil
    end

  end
end
