require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

player1 = Player.new()
player2 = Player.new()
new_board = Board.new()

game = Game.new(player1, player2, board)
game.start