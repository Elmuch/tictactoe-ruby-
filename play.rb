require_relative 'lib/board'
require_relative 'lib/human'
require_relative 'lib/ai'
require_relative 'lib/tictactoe'
require_relative 'lib/players'
require_relative 'lib/game_state'


system('clear')

puts "+-------------------------------+\n
  WELCOME TO TICTACTOE \n
  Press q at any time to quit\n"
puts "+------------------------------+ \n\n"

  game = Tictactoe.new(Board.new)
  game.run
