require_relative "hand"

class Dealer
  attr_reader :name, :hand
  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def add_card_hand(card)
    @hand.add_card(card)
  end

  def add_card?(card)
    while dealer_score < 17 do
        add_card_hand(card)
    end
    if dealer_score >= 17
      return false
    end
    return true
  end

  def show_hand
    puts "#{@name}の引いたカードは#{hand.to_s}です"
  end

  def show_one_side_hand
    puts "#{@name}の引いたカードは#{hand.cards[0]}\n二枚目のカードは分かりません"
  end
  
  def dealer_score
    @hand.score
  end
end

#{hand.cards[i]}