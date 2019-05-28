
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
    @board[pos] = "X"
    puts @board
  end

  def moveO(pos)
    @board[pos] = "O"
    puts @board
  end


end

game1 = Game.new

game1.moveX("11")
game1.moveO("12")
game1.moveX("21")
game1.moveO("31")
