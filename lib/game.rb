class Game
    def initialize
    end

    def is_valid?(index)
        #validates input and returns 
        format_ok? && position_ok?
    end

    def format_ok?(index)
        #validates input format
        true if pos =~ /^[1-3][1-3]$/
    end

    def position_ok?(index)
        #checks if position is valid and/or available
        true if new_board.board[index] == nil
    end







    
    
    def start
      puts "Welcome to Tic Tac Toe"
      print "Start a new game by typing Start: "
      com = gets.chomp.downcase
      if com == "start"
        play
      else
        puts "Alright see ya later."
      end
    end

    def play
      print "Choose Single Player (1) or Multi Player (2): "
      choice = gets.chomp
      while choice != "1" && choice != "2"
        puts "Please enter 1 or 2: "
        choice = gets.chomp
      end
      if choice == "1"
        game2 = AiBoard.new
        game2.start
        replay
      elsif choice == "2"
        game1 = Board.new
        game1.start
        replay
      end
    end

    def replay
      print "Well done, would you like to play again? (yes / no) "
      answer = gets.chomp.downcase
      if answer == "yes"
          start_game = Game.new
          start_game.start
      else
        puts "Alright see ya later."
      end
    end

  end