class Game

  def initialize
    @board = Hash.new
    @score = Hash.new
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

      col = pos[1]
      row = pos[0]

      @score["row #{row}"] == nil ? @score["row #{row}"] = player : @score["row #{row}"] += player
      @score["col #{col}"] == nil ? @score["col #{col}"] = player : @score["col #{col}"] += player

      if col == row
        @score["dia1"] == nil ? @score["dia1"] = player : @score["dia1"] += player
      end

      if (col.to_i + row.to_i)/2 == 2
        @score["dia2"] == nil ? @score["dia2"] = player : @score["dia2"] += player
      end

      puts @board
      puts @score
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
    if winner == true
      return true
    elsif @board.length >= 9
      puts "Game is draw!"
      return true
    end
  end

  def winner
    @score.each do |key, value|
      if value == "XXX"
         puts "X is winner"
         return true
      elsif value == "OOO"
        puts "O is winner"
        return true
      end
    end
  end

end

class Welcome
  puts "Welcome to Tic Tac Toe"
  puts "Start a new game by typing Start"
  print "Command: "
  com = gets.chomp.downcase

  if com == "start"
  end
end


game1 = Game.new
game1.start