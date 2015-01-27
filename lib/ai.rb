# Implementation of minimax algorithm
#

class Ai
  attr_accessor :best_move, :turn

  def initialize(board,turn)
    @board = board
    @turn = turn 
    @best_move = Array.new
  end

  def minimax(board, turn, depth = 0)
    return weight_winners(depth) if board.game_over?
    possible_moves = Array.new
    moves_scores = Array.new

    board.each_cell() do |row, column|
      if board.get_element(row,column) == 0
        board.update_element(row,column,turn) # Get the state of the game 
        possible_moves << [row,column]
        moves_scores << minimax(board, -1*turn, depth + 1)
        board.update_element(row,column,0)
      end

    end
    # max 
    if turn == 1
      max_index = moves_scores.each_with_index.max[1]
      @best_move = possible_moves[max_index]
      return moves_scores[max_index]
    # min
    else 
      min_index = moves_scores.each_with_index.min[1]
      @best_move = possible_moves[min_index]
      return moves_scores[min_index]
    end 
  end

  def weight_winners(depth)
    return @board.get_winner*1000 if depth <= 2
    return @board.get_winner
  end

  def get_move()
    minimax(@board, @turn)
    return @best_move
  end

end
