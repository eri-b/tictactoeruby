require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/ui'

include Ui
settings = start

new_board = Board.new()
player1 = Player.new(settings[1], "X", new_board)
player2 = Player.new(settings[2], "O", new_board)

game = Game.new(player1, player2, new_board)
game.running if settings[0]