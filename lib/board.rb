class Board
  attr_accessor :board, :score

  def initialize
    @board = Hash.new
    @score = Hash.new("")
  end

  def position_ok?(index)
      #checks if position is valid and/or available
      true if @board[index] == nil
  end

  def add(index, symbol)
    #add value to the board if validated
    @board[index] = symbol
    record(index, symbol)
  end
  
  def print_board
    puts ""
    puts ""
    (1..3).each do |i|
      (1..3).each do |j|
        if @board["#{i}#{j}"]
          print @board["#{i}#{j}"] + "  "
        else
          print "#{i}#{j} "
        end
      end
      puts ""
    end
  end

  private

  def record(index, symbol)
    # creates a hash with all rows and columns and diagonals with board values
    col = index[1]
    row = index[0]

    @score["row #{row}"] += symbol
    @score["col #{col}"] += symbol

    @score["dia1"] += symbol if col == row
    @score["dia2"] += symbol if (col.to_f + row.to_f)/2 == 2.0
  end

end #Board Class