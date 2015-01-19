#
# Initializes a 3 * 3 matrix and defines methods for updating the element's values
#
require_relative "game_state"

class Board
  include GameState
  attr_accessor :dimension # could be just a reader but this works well in the specs

  def initialize
    @dimension = 3
    @matrix = Array.new(3) { Array.new(3) { 0 } } # initialize with 0
  end

  # Helper methods
  #

  def display()
    puts " +--------------------+"

    (0..@dimension).each do |row|
      puts "| " if row != 0
      (0..@dimension).each do |col|
        val = @matrix[row][col]
        if val == 0
          print (col + (row * 2) + 1).to_s
        else
          print val
        end
        print "| "
      end

    end

    puts "\n+--------------------+"
  end

  # Set the element in the matrix

  def update_element( row, column, avatar )
    @matrix[row][column] = avatar
  end

  # retrieve the element from the matrix

  def get_element( row, column )
    @matrix[row][column]
  end

  def validate_position(row, col)
    if row <= @matrix.size && col <= @matrix.size
      if @matrix[row][col] == 0
        return true
      else
        puts "The position has been taken"
      end
    else
      puts "Invalid position"
    end
    return false
  end

  def clear
    (0...@dimension).each do |row|
      (0...@dimension).each do |column|
        update_element(row,column,0)
      end
    end
  end

end
