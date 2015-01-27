# Switch and make player moves 
#
class Players
  attr_reader :turn

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @turn = 1
  end

  def switch_turns
    @turn *= -1
  end

  def set_player_move
    if @turn == 1
      move = @player_1.get_move()
      @board.update_element(move[0], move[1], @turn)
    elsif @turn == -1
      move = @player_2.get_move()
      @board.update_element(move[0], move[1], @turn)
    end

    switch_turns
  end

end
