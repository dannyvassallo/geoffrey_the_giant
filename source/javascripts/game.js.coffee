class window.Game extends Module
  # includes
  @include Emittable

  # class properties
  @history:[]
  

  # instance methods
  constructor:(@user, @opponent, @rounds=5)->
    @throw_history  = []
    @winner_history = []
    @over           = false

    @emittable()
    Game.history.push this

  game_over:()->
    @over = true
    if @user.round_wins > @opponent.round_wins
      @winner = @user
      @loser  = @opponent
    else
      @winner = @opponent
      @loser  = @user

    @trigger("game_over.before", [@winner, @loser])

    @winner.wins_game()
    @loser.loses_game()

    @trigger("game_over.after", [@winner, @loser])

    @removeAllListeners()

    return @winner


  user_throw:(gesture)->
    return false if @over

    user_throw      = @user.throw(gesture)
    opponent_throw  = @opponent.throw(Throw.random_gesture(gesture))

    @throw_history.push [user_throw,opponent_throw]

    if user_throw.does_beat(opponent_throw)
      round_winner  = @user
      round_loser   = @opponent
    else
      round_winner  = @opponent
      round_loser   = @user

    @trigger("throw.before", [round_winner, round_loser])

    round_winner.wins_round()
    round_loser.loses_round()

    @winner_history.push round_winner

    @trigger("throw.after", [round_winner, round_loser])

    @game_over() if @count_rounds() >= @rounds

    return round_winner

  count_rounds:()->
    @winner_history.length
