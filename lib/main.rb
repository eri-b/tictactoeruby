class Game

  def initialize
    @board = Hash.new
    @score = Hash.new("")
  end


  def move(player)
    # print current board
    print_board

    print "Player #{player}'s turn. Position of move: "
    pos = gets.chomp
    if valid?(pos) && empty?(pos)
      @board[pos] = player

      # Create record of possible winning outcomes
      record(pos, player)

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

  def record(pos, player)
    col = pos[1]
    row = pos[0]

    @score["row #{row}"] += player
    @score["col #{col}"] += player

    @score["dia1"] += player if col == row
    @score["dia2"] += player if (col.to_i + row.to_i)/2 == 2
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
        puts ""
        puts "X is winner"
        return true
      elsif value == "OOO"
        puts ""
        puts "O is winner"
        return true
      end
    end
  end

end

class Setup
  def initialize
  end

  def start
    puts "Welcome to Tic Tac Toe"
    print "Start a new game by typing Start:"
    com = gets.chomp.downcase
    if com == "start"
      game1 = Game.new
      game1.start
    else
      puts "Alright see ya later."
    end
  end

end

start_game = Setup.new
start_game.start

# game1 = Game.new
# game1.start
