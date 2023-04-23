require_relative "card"

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::TYPE.each do |type|  
        @cards << Card.new(rank, type)
      end
    end
     @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end