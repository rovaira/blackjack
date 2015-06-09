class Hand
  attr_reader :current_hand

  def initialize
    @current_hand = []
  end

  def score
    sum = 0
    ace_count = 0
    current_hand.each do |card|
      if card.face_card?
        sum += 10
      elsif card.rank == 'A'
        ace_count += 1
          if sum + (ace_count + 10) <= 21
            sum += (ace_count + 10)
          else
            sum += ace_count
          end
      else
        sum = sum + card.rank.to_i
      end
    end
    sum
  end

end
