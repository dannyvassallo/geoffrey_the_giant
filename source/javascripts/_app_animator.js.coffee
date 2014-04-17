class window.AppAnimator extends Module

  constructor:(@queue="fx")->
    @geoff  = new AnimatedElement "#geoff",
                    duration: 1200
                    queue:    "fx"
                    properties:
                      base_url: "https://s3.amazonaws.com/myfangate.com/geoffrey"

    @game   = new AnimatedElement "#game-container",
                    duration: 2400
                    queue:    "fx"

    @pow    = new Pow "#pow-container"


  animate_throws:(user_throw, opponent_throw)->
    Helpers.debug "animate_throws"

    @geoff.interrupt()

    _(3).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame1.png"
        .delay 50 
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame2.png"
        .delay 50
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame3.png"
        .delay 50
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame4.png"
        .delay 50
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame3.png"
        .delay 50
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame2.png"
        .delay 50
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "shake/frame1.png"
        .delay 50


    @geoff
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "throw_#{opponent_throw.type}.png"
      .delay 800
      .enqueue ()=>
        @pow.show()


  animate_round_win:()->
    @geoff
      .enqueue ($el)=>
        $el.css "background-color": "lightgreen"
      .delay()

  animate_round_loss:()->
    @geoff.delay(600)
    _(5).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame2.png"
        .delay(300)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame1.png"
        .delay(300)

    @geoff.delay 200

  animate_new_round:(callback=null)->

    @geoff.enqueue ($el)=>
      $el.css "background-color": "white"

      (callback || (->)).apply(this)

      @geoff.indefinitely 1000, ()=>
        @geoff
          .enqueue ($el)=>
            $el.css "background-image": CSS.url @geoff.base_url, "breathing/frame1.png"
          .delay 200
          .enqueue ($el)=>
            $el.css "background-image": CSS.url @geoff.base_url, "breathing/frame2.png"
          .delay 200
          .enqueue ($el)=>
            $el.css "background-image": CSS.url @geoff.base_url, "breathing/frame3.png"
          .delay 200
          .enqueue ($el)=>
            $el.css "background-image": CSS.url @geoff.base_url, "breathing/frame2.png"
          .delay 200

