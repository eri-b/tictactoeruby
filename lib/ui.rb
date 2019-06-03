module Ui

  def start
    puts ""
    puts "**********************"
    puts ""
    puts "Welcome to Tic Tac Toe"
    print "Start a new game by typing Start: "
    puts ""
    com = gets.chomp.downcase
    if com == "start"
      game_on = true
      names(game_on)
    else
      puts "Alright see ya later."
      exit
    end
  end

  def names(game_on)
    puts ""
    puts "Player 1 Name: "
    player1 = gets.chomp
    puts "#{player1} is X"
    puts ""
    puts "Player 2 Name: "
    player2 = gets.chomp
    puts "#{player2} is O"

    return [game_on, player1, player2]
  end

  def print_board(new_board)
    puts ""
    (1..3).each do |i|
      (1..3).each do |j|
        if new_board.board["#{i}#{j}"]
          print new_board.board["#{i}#{j}"] + "   "
        else
          print "#{i}#{j}  "
        end
      end
      puts ""
      puts ""
    end
  end

  def get_move(board, player)
    print_board(board)
    print "#{player.name}'s turn. Please enter your move: "
    user_move = gets.chomp.upcase
    user_move = check_format(user_move)
  end

  def check_format(input)
    while !format_ok?(input)
      print "Wrong format. Please enter your move: "
      input = gets.chomp.upcase
    end
    return input
  end

  def format_ok?(index)
    #validates input format
    true if index =~ /^[1-3][1-3]$/
  end

  def check_move(new_board, index)
    while !new_board.position_ok?(index)
      print "Position taken. Please select another: "
      #TODO loop the input
      new_try = gets.chomp.upcase
      index = check_format(new_try)
    end
    return index
  end

  def position_ok?(index)
      #checks if position is valid and/or available
      true if @board[index] == nil
  end

  def game_over(player, board)
      print_board(board)
      puts ""
      puts "#{player.name} is the winner"
  end

  def after_game
      print "Play again? (yes): "
      val = gets.chomp.downcase
      reset_game if val == "yes"
  end

  def draw_message
    puts "The game is draw!"
  end


end #module