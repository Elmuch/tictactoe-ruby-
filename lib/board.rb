#
# Initializes a 3 * 3 matrix and defines methods for updating the element's values
#
require_relative "game_state"

class Board
  include GameState

  attr_accessor :matrix # could be just a reader but this works well in the specs
  attr_reader :dimension

  def initialize
    @dimension = 3
    @matrix = Array.new(3) { Array.new(3) { 0 } }
  end

  def display()
    puts "+--------------------+"

    each_cell() do |row, column|
      puts "" if column == 0 && row == 0
      putc "|"
      putc "X" if get_element(row,column) == 1
      putc "O" if get_element(row,column) == -1
      putc " " if get_element(row,column) == 0
      putc "|"
      puts "" if column == @dimension - 1
    end

    puts "+--------------------+"
  end

  # Helper methods

  # Set the element in the matrix
  #
  def update_element( row, column, avatar)
    @matrix[row][column] = avatar
  end

  # retrieve the element from the matrix
  #
  def get_element( row, column )
    @matrix[row][column]
  end

  def each_cell()
    (0...@dimension).each do |row|
      (0...@dimension).each do |column|
        yield(row, column)
      end
    end
  end

end
