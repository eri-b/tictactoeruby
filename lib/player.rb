require_relative 'ui'

class Player
    include Ui
    attr_accessor :name, :symbol, :choices, :board

    def initialize(name, symbol, board)
        @name = name
        @symbol = symbol
        @board = board
        @choices = []
    end


    def move(index)
        @board.add(index, @symbol)
    end


end #player