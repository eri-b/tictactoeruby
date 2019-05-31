class Board
  attr_accessor :board

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
    #do something with score..
  end






  def record(pos, player)
    col = pos[1]
    row = pos[0]

    @score["row #{row}"] += player
    @score["col #{col}"] += player

    @score["dia1"] += player if col == row
    @score["dia2"] += player if (col.to_i + row.to_i)/2 == 2
  end



  #Player makes it's move
  def move(player, ai=false)
    print_board
    print "Player #{player}'s turn. Position of move: "

    # Multiplayer
    pos = gets.chomp if ai==false || player == "X"

    # Singleplayer
    pos = ai_play(player, ai) if ai==true && player == "O"

    check_move(pos, player)
  end

  #Check player's move validity
  def check_move(pos, player)
    if valid?(pos) && empty?(pos)
      @board[pos] = player

      # Create record of possible winning outcomes
      record(pos, player)

    elsif !valid?(pos)
      puts "Please enter a number displayed in the Board"
      move(player)
    elsif valid?(pos) && !empty?(pos)
      puts "Board position already taken"
      move(player)
    else
      puts "something is wrong"
      move(player)
    end
  end

  #Makes AI move
  def ai_play(player, ai)
    if ai == true && player == "O"
      arr = ["11","12","13","21","22","23","31","32","33"]
      @board.each do |key, value|
        arr.each do |x|
          arr.delete(x) if x == key
        end
      end

      random = rand(arr.length)
      pos = arr[random]
      print pos
      return pos
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

  private

  def game_over
    if winner == true
      return true
    elsif @board.length >= 9
      puts ""
      print_board
      puts ""
      puts "Game is draw!"
      return true
    end
  end

  def winner
    @score.each do |key, value|
      if value == "XXX"
        puts ""
        print_board
        puts ""
        puts "X is winner"
        return true
      elsif value == "OOO"
        puts ""
        print_board
        puts ""
        puts "O is winner"
        return true
      end
    end
  end

end #Board Class

class AiBoard < Board
  def move(player, ai=true)
    super
  end
end
