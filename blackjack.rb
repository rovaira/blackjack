#!/usr/bin/env ruby
require 'pry'
SUITS = ['spades', 'cloves', 'hearts', 'diamonds']
VALUES = ['A', '2', '3', '4','5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

class Card

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    ['J', 'Q', 'K'].include?(@rank)
  end

  def face_card_value
    if face_card?
      10
    end
  end

  def ace?
    "A".include?(@rank)
  end

end

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

class Hand
  attr_reader :current_hand

  def initialize
    @initial_draw = initial_draw
    @current_hand = []
  end

  def score
    sum = 0
    current_hand.flatten.each do |card|
      sum = sum + card.rank.to_i
    end
    sum
  end
end

class Game

  def initialize
    @deck = Deck.new
    @dealer_hand = initial_draw
    @player_hand = initial_draw

  end





  # def dealer_hand
  #   @dealer_hand
  # end
  #
  # def player_hand
  #   @player_hand
  # end
#
# binding.pry
#   puts player_hand

# 1 - Player gets dealt 2 cards to start ***

# 2 - Sum score of 2 cards & output

# 3 - If sum == 21 --> stop game, player wins

# 4 - If sum < 21 --> player chooses to hit or stay

# 5 - Until player says 'STAY', dealer deals another card to player

# 6 - After each deal, sum player's score and output

# 7 - If sum > 21, stop game, player loses

# 8 - If sum == 21, stop game, player wins

# 5 - After each deal, sum player's score and output

# 6 - Player is prompted w/ HIT? or STAY?

# 7 - When player chooses STAY, compute player's final score

# 8 - Save player's score to variable

# 9 - Computer gets dealt 2 cards to start

# 10 - Sum score of 2 cards

# 11 - If sum > 21 --> break, computer loses

# 12 - If sum < 17 --> deal again and compute new score

# 13 - If 17 < sum < 21 --> stop and save that score

# 14 - Compare player score and dealer score

# 15 - If player score > dealer score => player wins

# 16 - Elsif player score < dealer score => dealer wins

# 17 - Draw/Tie


  def initial_draw
    hand = Hand.new
    2.times {hand.current_hand << hit}
    hand
  end

  def hit
    @deck.draw!
  end

  def next_move?
    player_input_choice = gets.chomp.downcase
    if player_input_choice == 'h'
      @player_hand.current_hand << hit
    else player_input_choice == "s"
      player_score
    end
  end


  def score_analysis(hand)
    if hand.score > 21
      "lose"
    elsif hand.score == 21
      "you win!"
    else
      next_move?
    end
  end



  def player_score
    @player_hand.score
  end

  def play_game
    puts "Welcome to Blackjack!"
    puts "Player was dealt:"
    puts @player_hand.print_hand
    puts "Player was dealt:"
    puts @player_hand.print_hand
    puts "Player score:"
    puts @player_hand.score

    puts "Hit or stand (H/S):"



    puts "Dealer was dealt:"
    puts @dealer_hand.print_hand
    if @dealer_hand > 21
    else
    end






    puts player_score
  end

end



# new_game = Game.new
# player_hand = new_game.initial_deal
#
# puts new_game.initial_card_eval



# sum = 0
#
# if sum > 21
#   'You lost'
#   break
# elsif sum == 21
#   'You won'
#   break
# else
#   deal += sum
#   'Select hit or stay?'
# end






# hand = Hand.new
#
# hand.initial_draw
#
# playing_hand = []
#
# playing_hand.push(hand.initial_draw, hand.hit)
#
# puts playing_hand
#
# end
