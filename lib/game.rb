class Game
    def initialize (player1, player2, board)
      @player1 = player1
      @player2 = player2
      @board = board
    end

    def is_valid?(index)
        #validates input and returns
        format_ok? && position_ok?
    end

    def running
    #loop the game while it is still not over
      counter = 0
      while game_on
        play(counter)
        counter += 1
      end
      after_game
    end

    def play(counter)
        # take the current player move
        player = turn(counter)
        index = player.get_move
        player.move(index)
    end

    def turn(counter)
        counter % 2 == 0 ? @player1 : @player2
    end

    def game_on
        @board.score.each do |key, value|
            game_over(@player1) if value == "XXX"
            game_over(@player2) if value == "OOO"
        end
    end

    def game_over(player)
        puts "#{player} is the winner"
        return false
    end

    def after_game
        puts "Play again? (y / n)"
    end













=begin
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

=end

  end
