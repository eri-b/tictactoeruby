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

  def move(player)
    print "Player #{player}'s turn. Position of move: "
    pos = gets.chomp
    if valid?(pos) && empty?(pos)
      @board[pos] = player
      puts @board
    elsif !valid?(pos)
      puts "Format incorrect"
      move(player)
    elsif valid?(pos) && !empty?(pos)
      puts "Board position already full"
      move(player)
    else
      puts "something is wrong"
      move(player)
    end
  end

  def valid?(pos)
    true if pos =~ /^[1-3][1-3]$/
  end

  def empty?(pos)
    true if @board[pos] == nil
  end

  def start
    counter = 0
    gameOn = true
    while gameOn

      move("X") if counter % 2 == 0
      move("O") if counter % 2 == 1

      counter += 1

      gameOn = false if counter >= 4
    end
    puts "game over"
  end



end


game1 = Game.new
game1.start
