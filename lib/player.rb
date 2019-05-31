class Player
    attr_accessor :name, :symbol, :choices

    def initialize(name, symbol, choices)
        @name = name
        @symbol = symbol
        @choices = []
    end

    def get_move
      print "#{@name}'s turn. Please enter your move: "
      p_input = gets.chomp.upcase
      p_input if check_format(p_input)
    end

    def check_format(input)
      while !format_ok?(input)
        print "Wrong format. Please enter your move: "
        input = gets.chomp.upcase
      end
      return true
    end

    def format_ok?(index)
        #validates input format
        true if pos =~ /^[1-3][1-3]$/
    end

    def move(index)
        while !new_board.position_ok?
          puts "Position taken."
          get_move
        end
        new_board.add(index, @symbol)
    end

end
