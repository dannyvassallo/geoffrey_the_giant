class window.Driver extends Module
  @include Emittable

  constructor:(user_name=null)->
    @emittable()

    @animator     = new AppAnimator()

    @user         = new Player(user_name || "You")
    @opponent     = new Player("Geoffrey")
    @current_game = null

    @$btn_container = $(".buttons")
    @$btns          = @$btn_container.find(".action-btn")

    @enable_user_input()
    @new_game()

    @animator.animate_new_round()

  update_tally:()=>
    @user.round_wins

  on_throw:(winner, loser)=>
    @animator.animate_throws(@user.last_throw, @opponent.last_throw)

    if @user is winner
      @animator.animate_round_win(@update_tally)
    else
      @animator.animate_round_loss(@update_tally)

    @animator.animate_new_round(@enable_user_input)



  click_action:(action)=>
    @$btn_container.attr "data-click-action", action
    @disable_user_input()
    @current_game.user_throw(action)

  on_game_over:(winner, loser)=>
    @new_game()

  # allow user to click buttons
  enable_user_input:()=>
    $btn_container = @$btn_container
    $btn_container.attr "data-click-action", null
    self = this

    @$btns
      .removeClass("disabled")
      .on "click", (e)->
        e.preventDefault()
        self.click_action($(this).data("action"))
      .on "mouseenter", ->
        $btn_container.attr "data-hover-action", $(this).data("action")
      .on "mouseleave", ->
        $btn_container.attr "data-hover-action", null

  # disable buttons while animating
  disable_user_input:()->
    @$btns
      .addClass("disabled")
      .off "click"
      .off "mouseenter"
      .off "mouseleave"

    @$btn_container.attr "data-hover-action", null

  # create a new game and setup listeners
  new_game:()->
    @unbind_game_listeners()
    @current_game = new Game(@user, @opponent)
    @bind_game_listeners()

  # listen for certain game actions
  bind_game_listeners:()->
    @current_game.on "throw.after",     @on_throw
    @current_game.on "game_over.after", @on_game_over

  # stop listening once game is over
  unbind_game_listeners:()->
    @current_game && @current_game.removeAllListeners()
