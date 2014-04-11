class window.AppAnimator extends Module
  @include Animator

  constructor:(@queue="fx")->
    @duration = 1000
    @$buttons = $(".buttons")
    @$body    = $("body")
    @$geoff   = $("#geoff")

  animate_throws:(user_throw, opponent_throw)->
    @enqueue @$geoff, ()=>
      @$geoff.css "background-color": "grey"

    @delay @$geoff, @duration

  animate_round_win:()->
    @enqueue @$geoff, ()=>
      @$geoff.css "background-color": "green"
    
    @delay @$geoff, @duration

  animate_round_loss:()->
    @enqueue @$geoff, ()=>
      @$geoff.css "background-color": "red"
    
    @delay @$geoff, @duration

  animate_new_round:(callback=null)->
    @enqueue @$geoff, ()=>
      @$geoff.css "background-color": "black"
    
    @delay @$geoff, @duration

    @enqueue @$geoff, ()=>
      callback()
    


