require_relative "deck"

class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def score
    sum = @cards.inject(0) { |sum, card| sum + card.calculation_score(sum) }
    value_of_ace(sum)
  # sum = @cards.map{|sum, card| sum + card.calculation_score(sum)}.sum
  # value_of_ace(sum)
  end
  
  def value_of_ace(sum)
    @cards.each do |card|
      if card.rank == 'A' && sum > 21
        sum -= 10
      end
    end
    sum
  end

  def to_s
    @cards.map{|card|card.to_s}.join(', ')
  end
end