
class Tictactoe
  attr_reader :player_1, :player_2
  def initialize(board)
    @board  = board
  end

  def run
    choose_players
    @moves = Players.new(@board, @player_1, @player_2)

    until @board.game_over?
      @board.display
      @moves.set_player_move
    end

    @board.display

    unless @board.get_winner == 0
      puts "Player 1 Wins -_-" if @board.get_winner == 1
      puts "Player 2 Wins -_-" if @board.get_winner == -1
    else
      puts "Tie game."
    end

  end

  def choose_first_move
    choice = ""

    while choice!= "y" && choice != "n"
      puts "Would you like to go first? (y/n): "
      choice = gets.chomp

      if choice == "y"
        @player_1 = Human.new(@board)
        @player_2 = Ai.new(@board, -1)
      elsif choice == "n"
        @player_1 = Ai.new(@board, 1)
        @player_2 = Human.new(@board)
      end

    end
  end

  def choose_players
    game_type = 0

    while game_type > 3 || game_type < 1
      puts "How would you like to proceed? \n
      1 - Human vs. Human,\n
      2 - Human vs. Computer"
      game_type = gets.to_i

      if game_type == 1
        @player_1 = Human.new(@board)
        @player_2 = Human.new(@board)
      elsif game_type == 2
        choose_first_move
      end

    end
  end
end
