class Game

  def initialize
    @deck = Deck.new
    @dealer_hand = initial_draw
    @player_hand = initial_draw
  end

  def initial_draw
    hand = Hand.new
    2.times {hand.current_hand << hit}
    hand
  end

  def print_hit
    "#{hit.rank} #{hit.suit}"
  end

  def hit
    @deck.draw!
  end

  def print_hand
    str = ""
    @player_hand.current_hand.each do |card|
      str << "#{card.rank} #{card.suit} \n"
    end
    str
  end

  def print_dealer_hand
    str = ""
    @dealer_hand.current_hand.each do |card|
      str << "#{card.rank} #{card.suit} \n"
    end
    str
  end

  # -- PLAYER'S TURN -- #

  def hit_or_stay_prompt
    player_choice = ''
    while (player_choice != 'h') && (player_choice != 's')
      puts "Do you want to (h)it or (s)tay?:"
      player_choice = gets.chomp.downcase
    end
    player_choice
  end

  def next_move?
    player_choice = hit_or_stay_prompt

    if player_choice == 'h'
      @player_hand.current_hand << hit
      check_player_result
    elsif player_choice == 's'
      puts "Player Score: #{player_score}"
      computer_play
    end
  end

  def player_experience_over?
    player_score > 21 || player_score == 21
  end

  def check_player_result
    if player_experience_over?
      if player_score > 21
        puts print_hit
        puts "Player Score: #{player_score}"
        puts "Bust! Game over..."
      else
        puts print_hit
        puts "Player Score: #{player_score}"
        'You won!'
      end
    else
      puts print_hit
      puts "Player Score: #{player_score}"
      hit_or_stay_prompt
    end
  end

  # -- DEALER'S TURN -- #

  def computer_play

    until @dealer_hand.score >= 17 do
      @dealer_hand.current_hand << hit
    end

    puts print_computer_initial_draw
    puts "Dealer score: #{dealer_score}"
    puts "Dealer Stands."

    check_computer_result

  end


  def check_computer_result
    if dealer_score > 21
      puts "Dealer busts!"
    elsif dealer_score > player_score
      puts "Dealer wins!"
    elsif dealer_score < player_score
      puts "You win!"
    elsif dealer_score == player_score
      puts "Draw!"
    end
  end

#scores

  def dealer_score
    @dealer_hand.score
  end

  def player_score
    @player_hand.score
  end

  def print_initial_draw
%(
Welcome to Blackjack!
Player was dealt:
#{print_hand}
Player score: #{player_score}
)
  end


  def print_player_move
    next_move?
  end

  def print_computer_initial_draw
"Dealer was dealt:
#{print_dealer_hand}"
  end

  def print_computer_move
    computer_play
  end


end
