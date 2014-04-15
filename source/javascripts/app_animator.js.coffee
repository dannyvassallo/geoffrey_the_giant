class window.AppAnimator extends Module

  constructor:(@queue="fx")->
    @geoff  = new AnimatedElement "#geoff",
                  duration: 1000,
                  queue:    "fx"

  animate_throws:(user_throw, opponent_throw)->
    _(3).times ()=>
      @geoff
        .enqueue(($el)=>
          $el.css "background-color": "grey")
        .delay(200)
        .enqueue(($el)=>
          $el.css "background-color": "black")
        .delay(200)

  animate_round_win:()->
    @geoff
      .enqueue(($el)=>
        $el.css "background-color": "green")
      .delay()

  animate_round_loss:()->
    @geoff
      .enqueue(($el)=>
        $el.css "background-color": "red")
      .delay()

  animate_new_round:(callback=null)->
    @geoff
      .enqueue(($el)=>
        $el.css "background-color": "black")
      .delay()
      .enqueue callback
    


