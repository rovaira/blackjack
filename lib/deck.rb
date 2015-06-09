SUITS = ['spades', 'cloves', 'hearts', 'diamonds']
VALUES = ['A', '2', '3', '4','5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

class Deck

  attr_accessor :collection
  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end

    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end

end
