class Card
attr_reader :card, :suits, :score
  def initialize(card, suits)
    @card = card
    @suits = suits
    @score = score
  end

  def score(card)
    return card[1].to_i if card[1].to_i > 0
    case card[1]
    when "J" then 11
    when "Q" then 12
    when "K" then 13
    when "A" then 1
    end
  end
end

class Deck
  attr_reader :cards,
  def initialize
    @cards = []
    suits = %w(スペード ダイヤ クラブ ハート)
  numbers = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  suits.each do |suit|
    numbers.each do |number|
      deck << [suit, number]
    end
  end
  deck.shuffle
end


end

class Hand


end


def cards(rank, type)
  %w[A 2 3 4 5 6 7 8 9 10].each do |rank|
    %w[ハート ダイヤ クラブ  スペード].each do |type|
    end
  end
end

puts cards(2, "ハート")

def calculation_score(rank)
  case rank
  when 2..10
    rank
  when 'J', 'Q', 'K'
    10
  when 'A'
    1
  end
end