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

    @animate_new_round()

  animate_throws:(user_throw, opponent_throw)->
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
      # .enqueue ($el)=>
      #   $el.css "background-color": "lightgreen"
      .delay()

  animate_round_loss:()->
    @geoff
      .delay(600)
      # .enqueue ($el)=>
      #   $el.css "background-color": "pink"
      .delay(600)

    _(2).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "winning/frameone.png"
        .delay 200
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "winning/frametwo.png"
        .delay 200

    _(2).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "winning/framethree.png"
        .delay 200
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "winning/framefour.png"
        .delay 200

    @geoff.delay 200

  animate_new_round:(callback=null)->
    @geoff
    _(2).times ()=>
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
      .enqueue callback || (->)

