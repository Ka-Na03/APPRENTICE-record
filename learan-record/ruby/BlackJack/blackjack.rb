require_relative "deck"
require_relative "player"
require_relative "dealer"
require_relative "hand"
class BlackJack

  def initialize
    @player = Player.new("あなた")
    @dealer = Dealer.new("ディーラー")
    @deck = Deck.new
  end

  def show_game_farst
    @player.show_hand
    @dealer.show_one_side_hand
  end
  def hit_or_stay?
    puts "#{@player.name}の得点は#{@player.player_score}です。カードを引きますか？(H/S)"
    hit = gets.chomp.upcase
    hit == "H"
  end
 
  def player_turn
    while @player.player_score < 21 && hit_or_stay?
        card = @deck.deal
        @player.add_card_hand(card)
        @player.show_hand
      if @player.player_score == 21
        puts "!!BLACK JACK!!"
      elsif @player.player_score > 21
      end
    end
  end

  def dealer_turn
    while true
      if @dealer.dealer_score >= 17
        break
      else
        card = @deck.deal
        @dealer.add_card_hand(card)
        @dealer.show_hand
        puts "#{@dealer.name}の得点は#{@dealer.dealer_score}です。"
        if @dealer.dealer_score > 21
          break
        end
      end
    end
  end

  def judge_game
    if @player.player_score > 21
      puts "#{@player.name}はバーストしました"
      puts "#{@player.name}の負けです。"
    elsif @dealer.dealer_score > 21
      puts "#{@dealer.name}はバーストしました"
      puts "#{@dealer.name}の負けです。"
    elsif @player.player_score == @dealer.dealer_score
      puts "得点が同じな為ドローです。"
    elsif @player.player_score > @dealer.dealer_score
      puts "#{@player.name}得点は#{@player.player_score}点です。"
      puts "#{@dealer.name}の得点は#{@dealer.dealer_score}点です。"
      puts "#{@player.name}の勝ちです。"
    elsif @player.player_score < @dealer.dealer_score
      puts "#{@player.name}得点は#{@player.player_score}点です。"
      puts "#{@dealer.name}の得点は#{@dealer.dealer_score}点です。"
      puts "#{@dealer.name}の勝ちです。"
    end
  end

  def start
    puts "ブラックジャックを開始します。"
    2.times do
      card = @deck.deal
      @player.add_card_hand(card)
    end
    2.times do
      card = @deck.deal
      @dealer.add_card_hand(card)
    end
    show_game_farst
    player_turn
    dealer_turn
    judge_game
  end
end
blackjack = BlackJack.new

blackjack.start