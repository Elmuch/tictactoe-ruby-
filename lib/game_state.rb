module GameState

  def each_cell()
    (0...@dimension).each do |row|
      (0...@dimension).each do |column|
        yield(row, column)
      end
    end
  end

  def print()
    each_cell() do |row, column|
      puts "" if column == 0 && row == 0
      putc "|"
      putc "X" if get_element(row,column) == 1
      putc "O" if get_element(row,column) == -1
      putc " " if get_element(row,column) == 0
      putc "|"
      puts "" if column == @dimension - 1
    end
  end

  def winning_line?(avatars)
    avatars.abs == @dimension
  end

  def update_avatars(avatars, row, column)
    avatars += get_element(row,column)
  end

  def has_horizontal_winner?()
    avatars = 0
    each_cell() do | row, column |
      avatars = 0 if column.zero?
      avatars = update_avatars(avatars, row, column)
      return avatars if winning_line?(avatars)
    end
    return 0
  end

  def has_vertical_winner?()
    avatars = 0
    each_cell() do | column, row |
      avatars = 0 if row.zero?
      avatars = update_avatars(avatars, row, column)
      return avatars if winning_line?(avatars)
    end
    return 0
  end

  def check_diagonal_winner(index_of_left_diagonal)
    avatars = 0
    (0...@dimension).each do |cell|
      avatars = 0 if cell.zero?
      avatars = update_avatars(avatars, (index_of_left_diagonal - cell).abs, cell)
      return avatars if winning_line?(avatars)
    end
    return 0
  end

  def has_diagonal_winner?()
    @markers = check_diagonal_winner(0)
    return @markers if @markers.abs == @dimension
    return check_diagonal_winner(@dimension - 1)
  end

  def total_moves()
    @total = 0
    each_cell() do |row, column|
      @total += 1 if get_element(row,column) != 0
    end
    return @total
  end

  def has_full_board?()
    total_moves() == @dimension*@dimension
  end

  def empty_board?()
    total_moves() == 0
  end

  def game_over?()
    has_vertical_winner?().abs == @dimension || has_horizontal_winner?().abs == @dimension || has_diagonal_winner?().abs == @dimension || has_full_board?()
  end

  def get_winner()
    if game_over?()
      @horizontal = has_horizontal_winner?()/@dimension
      @vertical = has_vertical_winner?()/@dimension
      @diagonal = has_diagonal_winner?()/@dimension
      return @horizontal | @vertical | @diagonal
    end
  end

end
