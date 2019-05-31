class Player
    attr_accessor :name, :symbol, :choices

    def initialize(name, symbol, choices)
        @name = name
        @symbol = symbol
        @choices = []
    end

    def move(index)
        board.add(index)
    end

end
