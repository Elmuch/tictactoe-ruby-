
class Ai
  attr_reader :best_move

  def initialize(board,turn)
    @board = board
    @turn = turn
    @best_move = Array.new
  end

  def minimax(board, turn, depth = 0)
    return take_middle if @board.empty_board?
    return weight_winners(depth) if @board.game_over?
    possible_moves = Array.new
    moves_scores = Array.new
    @board.each_cell() do |row, column|
      if @board.get_element(row,column) == 0
        @board.update_element(row,column,turn)
        possible_moves << [row,column]
        moves_scores << minimax(@board, -1*@turn, depth + 1)
        board.update_element(row,column,0)
      end
    end
    set_best_move(possible_moves, moves_scores, turn)
    return set_score_of_path(moves_scores)
  end

  def take_middle
    @best_move = [1,1]
    return 0
  end

  def weight_winners(depth)
    return @board.get_winner*1000 if depth <= 2
    return @board.get_winner
  end

  def set_best_move(possible_moves, moves_scores, turn)
    @best_path = 0
    (0...moves_scores.size).each do |index|
      @best_path = index if turn == 1 && moves_scores[index] > moves_scores[@best_path]
      @best_path = index if turn == -1 && moves_scores[index] < moves_scores[@best_path]
    end
    @best_move = possible_moves[@best_path]
  end

  def set_score_of_path(moves_scores)
    @total_score = 0
    (0...moves_scores.size).each do |index|
      @total_score += moves_scores[index]
    end
    return @total_score
  end

  def get_move()
    minimax(@board, @turn)
    return best_move
  end

end
