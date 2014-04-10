class window.Driver extends Module
  @include Emittable

  constructor:(user_name=null)->
    @emittable()
    @user         = new Player(user_name || "You")
    @opponent     = new Player("Geoffrey")
    @current_game = null

    @new_game()

  new_game:()->
    @unbind_listeners()
    @current_game = new Game(@user, @opponent)
    @bind_listeners()

  bind_listeners:()->
    @current_game.on "throw.after", (winner, loser)=>
      alert("#{winner.last_throw.type} beats #{loser.last_throw.type}")

    @current_game.on "game_over.after", (winner, loser)=>
      if @user is winner
        alert "You win!!!"
      else
        alert "You lose.."

      @new_game()

  unbind_listeners:()->
    @current_game && @current_game.removeAllListeners()
