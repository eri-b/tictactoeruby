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
          print new_board.board["#{i}#{j}"] + "  "
        else
          print "#{i}#{j}  "
        end
      end
      puts ""
      puts ""
    end
  end

  def check_move(new_board, index)
    while !new_board.position_ok?(index)
      print "Position taken. Please select another: "
      #TODO loop the input
      new_try = gets.chomp.upcase
      index = new_try if check_format(new_try)
    end
    index
  end



end #module
