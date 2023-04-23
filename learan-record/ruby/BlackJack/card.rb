 
class Card
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
  TYPE = %w[ハート ダイヤ クラブ スペード]
  attr_reader :rank, :type
  
  def initialize(rank, type)
    @rank = rank
    @type = type
  end

  def calculation_score(sum)
    return 11 if @rank == 'A' && sum <= 11
    return 1 if @rank == 'A'
    return @rank.to_i if @rank.to_i > 0
    10
    # case @rank
    # when 'J', 'Q', 'K'
    #   10
    # when 'A'
    #   1
    # end
  end
  
  def to_s
    "#{@type}の#{@rank}"
  end
end