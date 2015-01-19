$: << File.dirname( __FILE__)

require 'lib/board'
require 'lib/human'
require 'lib/ai'
require 'lib/tictactoe'
require 'lib/players'
require 'lib/game_state'


system('clear')

puts "+-------------------------------+\n
  WELCOME TO TICTACTOE \n
  Press q at any time to quit\n"
puts "+------------------------------+ \n\n"

  game = Tictactoe.new(Board.new)
  game.run
