class TowersOfHanoi
  attr_reader :stacks

  def initialize
    @stacks = [[3, 2, 1], [], []]
  end

  def move(from, to)
    # input from 0 - 2
    unless [from, to].all? { |stack_num| stack_num.between?(0, 2) }
      raise ArgumentError.new "Not a valid stack."
    end

    raise ArgumentError.new "Stack empty" if @stacks[from].empty?
    if @stacks[to].empty? || @stacks[from].last < @stacks[to].last
      @stacks[to] << @stacks[from].pop
    else
      puts "Illegal move"
    end
  end

  def play
    until won?
      begin
        render
        input = gets.chomp.split(', ').map(&:to_i)
        from, to = input
        move(from, to)
      rescue
        retry
      end
    end
    puts "You won!"
  end

  def render
    p @stacks
  end

  def won?
    @stacks[1] == [3,2,1] || @stacks[2] == [3,2,1]
  end
end

if __FILE__ == $PROGRAM_NAME
  TowersOfHanoi.new.play
end
