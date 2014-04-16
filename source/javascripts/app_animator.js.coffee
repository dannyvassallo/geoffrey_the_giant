class window.AppAnimator extends Module

  constructor:(@queue="fx")->
    @geoff  = new AnimatedElement "#geoff",
                    duration: 1000,
                    queue:    "fx"

    @game  = new AnimatedElement "#game-container",
                  duration: 2200,
                  queue:    "fx"

  animate_throws:(user_throw, opponent_throw)->
    _(3).times ()=>
      @geoff
        .enqueue(($el)=>
          $el.css "background-color": "grey"
          $el.css "background-image": "url(\"https://s3.amazonaws.com/myfangate.com/geoffrey/bodytest.png\")")
        .delay(200)
        .enqueue(($el)=>
          $el.css "background-color": "black")
        .delay(200)

    @game
      .enqueue(($el)=>
        $el.css "background-color": "black")
      .delay()

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
      .enqueue callback

    @game
      .enqueue(($el)=>
        $el.css "background-color": "white")
    


