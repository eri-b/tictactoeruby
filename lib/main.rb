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
    game_on = true
    while game_on

      move("X") if counter % 2 == 0
      move("O") if counter % 2 == 1

      counter += 1

      game_on = false if game_over

    end
    puts "game over"
  end

  def game_over
    if @board["11"] && @board["12"] && @board["13"] == "X" || 
       @board["21"] && @board["22"] && @board["23"] == "X" ||
       @board["31"] && @board["32"] && @board["33"] == "X"
      puts "X is a winner"
      check_board
      return true
    elsif @board.length >= 9
      puts "Game is draw!"
      return true
    end
  end

  def check_board
    i = 1
    count = 0
    
      @board.each do |key, value|
        col = key[0]
        row = key[1]
    end
  end

end


game1 = Game.new
game1.start