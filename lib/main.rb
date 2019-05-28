class Game

  def initialize
    @board = Hash.new
  end

=begin

board
11 12 13
21 22 23
31 32 33

=end

  def moveX(pos)
    if valid?(pos)
      if empty?(pos)
        @board[pos] = "X"
        puts @board
      else
        puts "not empty"
      end
    else
      puts "invalid entry"
    end
  end

  def moveO(pos)
    if valid?(pos)
      if empty?(pos)
        @board[pos] = "O"
        puts @board
      else
        puts "not empty"
      end
    else
      puts "invalid entry"
    end
  end

  def valid?(pos)
    true if pos =~ /^[1-3][1-3]$/ 
  end

  def empty?(pos)
    true if @board[pos] == nil
  end

end

game1 = Game.new

game1.moveX("11")
game1.moveO("12")
game1.moveX("21")
game1.moveO("31")
game1.moveO("55")
game1.moveX("11")