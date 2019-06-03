require_relative 'ui'

class Game
  include Ui

    def initialize (player1, player2, board)
      @player1 = player1
      @player2 = player2
      @board = board
    end

    def running
    #loop the game while it is still not over
      counter = rand(2)
      while game_on
        play(counter)
        counter += 1
      end
      after_game
    end

    private

    def play(counter)
        # take the current player move
        player = turn(counter)
        index = get_move(@board, player)
        index = check_move(@board, index)
        player.move(index)
    end

    def turn(counter)
        counter % 2 == 0 ? @player1 : @player2
    end

    def game_on
      @board.score.each do |key, value|
          game_over(@player1, @board) if value == "XXX"
          game_over(@player2, @board) if value == "OOO"
          return false if value == "XXX" || value == "OOO"
      end
    end

    def reset_game
      @board.board = Hash.new
      @board.score = Hash.new("")
      running
    end

    #TODO create AI (maybe?)
        #auto generates a name
        #auto allocate to player2
        #inputs
            #auto generates based on board positions? or
            #totally random input based on available positions?

  end
