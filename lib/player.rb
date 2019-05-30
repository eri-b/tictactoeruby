#Player makes it's move
def move(player, ai=false)
    print_board
    print "Player #{player}'s turn. Position of move: "

    # Multiplayer
    pos = gets.chomp if ai==false || player == "X"

    # Singleplayer
    pos = ai_play(player, ai) if ai==true && player == "O"

    check_move(pos, player)
  end