#!/usr/bin/env ruby
require 'pry'

require_relative "lib/card"
require_relative "lib/deck"
require_relative "lib/hand"
require_relative "lib/game"

test = Game.new

puts test.print_initial_draw
# puts test.print_player_move
# puts test.print_computer_initial_draw
# puts test.print_computer_move
puts test.print_player_move


#binding.pry
puts 'hello'
