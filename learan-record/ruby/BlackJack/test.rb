class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case @rank
    when 'A'
      11
    when 'K', 'Q', 'J', '10'
      10
    else
      @rank.to_i
    end
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    ['♠', '♥', '♦', '♣'].each do |suit|
      (2..10).each { |rank| @cards << Card.new(rank.to_s, suit) }
      ['J', 'Q', 'K', 'A'].each { |rank| @cards << Card.new(rank, suit) }
    end
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add(card)
    @cards << card
  end

  def value
    hand_value = @cards.map(&:value).sum
    num_aces = @cards.count { |card| card.rank == 'A' }
    while hand_value > 21 && num_aces > 0
      hand_value -= 10
      num_aces -= 1
    end
    hand_value
  end

  def display
    @cards.each { |card| puts "#{card.rank}#{card.suit}" }
  end
end

class Player
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end

  def hit(card)
    @hand.add(card)
  end
  def bust?
    @hand.value > 21
  end
end

class Dealer < Player
  def initialize
    super
    @show_all = false
  end

  def hit_until_done(deck)
    while self.hand.value <= 17
      hit(deck.draw)
    end
  end

  def display
    if @show_all
      hand.display
    else
      puts "#{hand.cards.first.rank}#{hand.cards.first.suit} - [unknown card]"
    end
  end

  def show_all
    @show_all = true
  end
end
class BlackJack
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start_game
    2.times do
      player.hit(deck.draw)
      dealer.hit(deck.draw) 
    end
    
    show_hands
    # player's turn
    player_turn

    # dealer's turn
    dealer_turn

    # determine the winner
    determine_winner
  end

  def player_decision
    print "Do you want to hit or stay? (h/s): "
    decision = gets.chomp.downcase
    until decision == 'h' || decision == 's'
      print "Invalid input. Please enter h or s: "
      decision = gets.chomp.downcase
    end
    decision == 'h'
  end

  def player_turn
    while player.hand.value < 21 && player_decision
      player.hit(deck.draw) 
      show_hands
      if player.bust?
        puts "You busted! Dealer wins!"
        exit
      end
    end
  end

  def dealer_turn
    dealer.show_all
    while dealer.hit_until_done(@deck)
      dealer.show_all
    end
    puts "Dealer stays."
  end

  def determine_winner
    player_score = player.hand.value
    dealer_score = dealer.hand.value

    if player_score > dealer_score || dealer_score > 21
      dealer.show_all
      puts "Player wins!"
    elsif player_score < dealer_score
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def show_hands
    puts "Player's hand: "
    player.hand.display
    puts "Total value: #{player.hand.value}"
    dealer.display
  end
end

class Game
  def start
    puts "Welcome to BlackJack!"
    puts "---------------------"

    BlackJack.new.start_game
  end
end

Game.new.start


  # def start
  #   puts "ブラックジャックを開始します。"
  #   2.times do
  #     card = @deck.deal
  #     @player.add_card_hand(card)
  #     puts "#{@player.name}の引いたカードは#{card}です"
  #   end
  #     card = @deck.deal
  #     @dealer.add_card_hand(card)
  #     puts "#{@dealer.name}の引いたカードは#{card}です"
  #     @dealer.add_card_hand(card)
  #     puts "#{@dealer.name}の引いた二枚目のカードは#{わかりません}"
  # end
