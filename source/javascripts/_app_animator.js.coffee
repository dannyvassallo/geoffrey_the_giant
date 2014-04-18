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
    @geoff.interrupt()

    Helpers.debug "animate_throws"

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


    @geoff
      .delay 200
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "throw_#{opponent_throw.type}.png"
      .delay 2000
      .enqueue ()=>
        # @pow.$el.css "background-image": CSS.url @geoff.base_url, "throw_#{opponent_throw.type}.png"
        @pow.show()



  animate_round_loss:(fn=null)->
    @geoff
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "winning/frame1.png"
      .delay 100 
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "winning/frame2.png"
      .delay 100
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "winning/frame3.png"
      .delay 100
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "winning/frame4.png"
      .delay 100
      .enqueue ($el)=>
        $el.css "background-image": CSS.url @geoff.base_url, "winning/frame5.png"
      .delay 600

    @geoff.enqueue =>
      fn.apply this if fn


  animate_round_win:(fn=null)->
    @geoff.delay(600)
    _(5).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame2.png"
        .delay(300)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame1.png"
        .delay(300)

    @geoff.enqueue =>
      fn.apply this if fn

    @geoff.delay 200

  animate_new_round:(callback=null)->

    @geoff.enqueue ($el)=>

      (callback || (->)).apply(this)

      @geoff.indefinitely 900, ()=>
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

