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



end #module
