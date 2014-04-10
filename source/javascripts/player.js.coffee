class window.Player
  animator:null
  name:null

  round_wins:0
  round_losses:0

  game_wins:0
  game_losses:0

  constructor:(@name=null,@animator=null)->
    @prepare_for_new_game()

  wins_round:()->
    @round_wins++

  loses_round:()->
    @round_losses++

  wins_game:()->
    @game_wins++
    @prepare_for_new_game()

  loses_game:()->
    @game_losses++
    @prepare_for_new_game()

  prepare_for_new_game:()->
    @round_wins    = 0
    @round_losses  = 0
