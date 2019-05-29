require '../lib/main.rb'

class Setup
    def initialize
    end
  
    def start
      puts "Welcome to Tic Tac Toe"
      print "Start a new game by typing Start: "
      com = gets.chomp.downcase
      if com == "start"
        print "Choose Single Player (1) or Multi Player (2): "
        

        game1 = Game.new
        game1.start
        print "Well done, would you like to play again? (yes / no) "
        answer = gets.chomp.downcase
        if answer == "yes"
            start_game = Setup.new
            start_game.start
        else
          puts "Alright see ya later."
        end
      else
        puts "Alright see ya later."
      end
    end
  
  end
  
  start_game = Setup.new
  start_game.start