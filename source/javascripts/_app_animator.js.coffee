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
      .delay 1000
      .enqueue ()=>
        image_name = if user_throw.does_beat opponent_throw then "#{user_throw.type}#{opponent_throw.type}" else "#{opponent_throw.type}#{user_throw.type}"
        @pow.$el.find("img").attr "src": @geoff.base_url + "/starburst/#{image_name}.png"
        @pow.show()
      .delay 1000



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
    _(3).times ()=>
      @geoff
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame1.png"
        .delay(100)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame2.png"
        .delay(100)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame3.png"
        .delay(100)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame4.png"
        .delay(100)
        .enqueue ($el)=>
          $el.css "background-image": CSS.url @geoff.base_url, "losing/frame1.png"
        .delay(100)

    @geoff.enqueue =>
      fn.apply this if fn

    @geoff.delay 100

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


  animate_game_over:(fn=null)->

    @geoff.enqueue ($el)=>

      if @winner == @user
        share_modal.open()
      else
        lost_modal.open()

