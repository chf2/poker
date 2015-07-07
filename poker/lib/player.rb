class Player
  attr_accessor :hand
  attr_reader :pot
  def initialize(pot)
    @pot = pot
    @hand = nil
    @folded = false
  end

  def get_discards
    begin
      puts "Which cards to discard? e,g. 0, 3, 4"
      input = gets.chomp.split(', ')
      raise ArgumentError.new "Too many cards" if input.size > 3
    rescue
      retry
    end
    remaining_cards = []
    @hand.cards.each_with_index do |card, idx|
      remaining_cards << card unless input.include?(idx)
    end

    @hand = Hand.new(remaining_cards)
    input.count
  end

  def folded?
    @folded
  end

  def get_move(current_bet)
    amt = 0
    valid_inputs = ['fold', 'call', 'raise']
    begin
      puts "Your hand: "
      p @hand
      puts "(fold, call, raise)?"
      input = gets.chomp.downcase
      raise ArgumentError.new "Not valid input" unless valid_inputs.include?(input)
      if input == 'raise'
        puts "how much?"
        amt = Integer(gets)
        @pot -= (amt + current_bet)
      elsif input == 'fold'
        @folded = true
      else
        puts "player calls/checks"
        @pot -= (current_bet)
      end
    rescue
      retry
    end

    [input, amt]
  end

  def get_winnings(won_pot)
    @pot += won_pot
  end

end