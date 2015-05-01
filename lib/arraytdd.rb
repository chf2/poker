class Array
  def my_uniq
    uniq_array = []
    self.each { |el| uniq_array << el unless uniq_array.include?(el) }
    uniq_array
  end

  def two_sum
    two_sum_pairs = []

    self.each_with_index do |el,idx|
      next if idx + 1 == size
      ((idx+1)...size).each do |idx2|
        if el + self[idx2] == 0
          two_sum_pairs << [idx,idx2]
        end
      end
    end

    two_sum_pairs

  end

  def my_transpose
    transpose_array = Array.new(size) { Array.new(size) }

    size.times do |row|
      size.times do |col|
        transpose_array[col][row] = self[row][col]
      end
    end

    transpose_array
  end

  def stock_picker
    best_profit_pair = nil
    best_profit = 0
    self.each_with_index do |el, idx| 
      next if idx + 1 == size
      ((idx+1)...size).each do |idx2|
        profit = self[idx2] - el
        if profit >= best_profit
          best_profit_pair = [idx, idx2]
          best_profit = profit
        end
      end
    end

    best_profit_pair
  end
end
