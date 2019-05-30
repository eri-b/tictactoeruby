require '../lib/main.rb'

class Game
    def initialize
    end

    def start
      puts "Welcome to Tic Tac Toe"
      print "Start a new game by typing Start: "
      com = gets.chomp.downcase
      if com == "start"
        print "Choose Single Player (1) or Multi Player (2): "
        choice = gets.chomp
        while choice != "1" && choice != "2"
          puts "Please enter 1 or 2: "
          choice = gets.chomp
        end
        if choice == "1"
          game2 = AiBoard.new
          game2.start
        elsif choice == "2"
          game1 = Board.new
          game1.start
        end

        print "Well done, would you like to play again? (yes / no) "
        answer = gets.chomp.downcase
        if answer == "yes"
            start_game = Game.new
            start_game.start
        else
          puts "Alright see ya later."
        end
      else
        puts "Alright see ya later."
      end
    end

  end

  start_game = Game.new
  start_game.start
