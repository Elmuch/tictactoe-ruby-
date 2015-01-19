#
#

class Human

  def initialize(board, avatar)
    @board = board
    @avatar = avatar
  end

  def get_move()
    @user_input = [-1,-1]

    while !valid_move?(@user_input[0],@user_input[1])
      @user_input = get_input
    end

    return @user_input
  end

  def valid_move?(row,column)
    valid_index?(row,column) && @board.get_element(row, column) == 0 && !@board.game_over?
  end

  def valid_index?(row, column)
    return (row < @board.dimension && column < @board.dimension && row >= 0 && column >= 0)
  end

  def get_input
    @input = Array.new
    print "Enter the cordinates: "
    @input << gets.chomp.to_i
    print "Enter the cordinates: "
    @input << gets.chomp.to_i
    @input[0] -= 1
    @input[1] -= 1
    return @input
  end

end
