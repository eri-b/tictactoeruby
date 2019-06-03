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

    def get_move
      print_board(@board)
      print "#{@name}'s turn. Please enter your move: "
      p_input = gets.chomp.upcase
      p_input if check_format(p_input)
    end

    def move(index)
        @board.add(index, @symbol)
    end

    private

    def check_format(input)
      while !format_ok?(input)
        print "Wrong format. Please enter your move: "
        input = gets.chomp.upcase
      end
      return true
    end

    def format_ok?(index)
      #validates input format
      true if index =~ /^[1-3][1-3]$/
    end

end