class window.Game
  possible_gestures: ["rock","paper","scizzors","lizard","spock"]
  throw_history:[]
  winner_history:[]
  
  player:null
  opponent:null


  constructor:(@player, @opponent, @rounds=5)->

  game_over:()->
    if @player.round_wins > @opponent.round_wins
      @winner = @player
      @loser  = @opponent
    else
      @winner = @opponent
      @loser  = @player

    @winner.wins_game()
    @loser.loses_game()

    @winner


  player_throw:(gesture)->
    player_throw = new Throw(gesture)
    opponent_throw = new Throw(@random_gesture())

    @throw_history.push [player_throw,opponent_throw]

    round_winner
    round_loser

    if player_throw.does_beat(opponent_throw)
      round_winner  = @player
      round_loser   = @opponent
    else
      round_winner  = @opponent
      round_loser   = @player

    round_winner.wins_round()
    round_loser.wins_round()

    @winner_history.push round_winner

    @game_over() if @count_rounds() > @rounds

    return 

  count_rounds:()->
    @winner_history.length

  random_gesture:()->
    @possible_gestures[Math.floor(Math.random()*@possible_gestures.length)]
