# require_relative '../lib/board.rb'
# require_relative '../lib/game.rb'
# require_relative '../lib/player.rb'
require_relative '../lib/ui'
extend Ui
settings = start

player1 = Player.new(settings[1], "X")
player2 = Player.new(settings[2], "O")
new_board = Board.new()

game = Game.new(player1, player2, board)
game.start if settings[0]
