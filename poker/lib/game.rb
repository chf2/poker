require_relative 'deck'
require_relative 'player'
require_relative 'hand'

class PokerGame
  def initialize(player1, player2, player3)
    @player1, @player2, @player3 = player1, player2, player3
    @deck = Deck.new
    @pot = 0
    @round = 0
    @players = [@player1, @player2, @player3]
  end

  def play
    @players.each do |player|
      player.hand = Hand.new(@deck.deal(5))
    end
    until @round == 2
      get_player_discards if @round == 1
      current_bet = 0
      player_count = 0
      @players.each do |player|
        player_count += 1
        next if player.folded?
        puts "It's player #{player_count}'s turn."
        puts "The bet is currently #{current_bet}."
        move = player.get_move(current_bet)
        @pot += current_bet if move[0] == 'call'
        if move[0] = 'raise'
          current_bet += move[1]
          @pot += current_bet
        end
      end
      @round += 1
    end
    winner = get_winner
    puts "#{winner} won with #{winner.hand}!"
    winner.get_winnings(@pot)

  end

  def get_winner
  end

  def get_player_discards
    player_count = 0
    @players.each do |player|
      player_count += 1
      next if player.folded?
      puts "Player #{player_count}, choose cards to discard"
      num_new_cards = player.get_discards
      player.hand.cards.concat(@deck.deal(num_new_cards))
    end
  end


end