require_relative "hand"

class Player
  attr_reader :name, :hand
  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def add_card_hand(card)
    @hand.add_card(card)
  end
  
  def show_hand
    puts "#{@name}の引いたカードは#{hand.to_s}です"
  end
  def player_score
    @hand.score
  end
end