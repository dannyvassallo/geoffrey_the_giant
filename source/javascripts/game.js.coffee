class window.Game
  throw_history:[]
  winner_history:[]
  
  user:null
  opponent:null

  over:false


  constructor:(@user, @opponent, @rounds=5)->

  game_over:()->
    @over = true
    if @user.round_wins > @opponent.round_wins
      @winner = @user
      @loser  = @opponent
    else
      @winner = @opponent
      @loser  = @user

    @winner.wins_game()
    @loser.loses_game()

    @winner


  user_throw:(gesture)->
    return false if @over

    user_throw      = new Throw(gesture)
    opponent_throw  = new Throw()

    @throw_history.push [user_throw,opponent_throw]

    if user_throw.does_beat(opponent_throw)
      round_winner  = @user
      round_loser   = @opponent
    else
      round_winner  = @opponent
      round_loser   = @user

    round_winner.wins_round()
    round_loser.loses_round()

    @winner_history.push round_winner

    @game_over() if @count_rounds() > @rounds

    return round_winner

  count_rounds:()->
    @winner_history.length
