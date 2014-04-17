$ ->
  $buttons_container  = $ ".buttons"
  $buttons            = $buttons_container.find ".action-btn"
  
  window.driver = new Driver("You")

  Helpers.preload_images [
      "https://s3.amazonaws.com/myfangate.com/geoffrey/bodytest.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frameone.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frametwo.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/framethree.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/framefour.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/breathing/frame1.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/breathing/frame2.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/breathing/frame3.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/breathing/frame4.png"

    ]

  $buttons
    .on("mouseenter", ->
      $buttons_container.attr "data-hover-action", $(this).data("action"))
    .on("mouseleave", ->
      $buttons_container.attr "data-hover-action", null)

    # $btn = $(this)
    # gesture = new Throw($btn.data "action")
    # gesture
