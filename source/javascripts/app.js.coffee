$ ->
  $buttons_container  = $ ".buttons"
  $buttons            = $buttons_container.find ".action-btn"
  
  window.driver = new Driver("You")

  Helpers.preload_images [
      "https://s3.amazonaws.com/myfangate.com/geoffrey/bodytest.png"
    ]

  $buttons
    .on("mouseenter", ->
      $buttons_container.attr "data-hover-action", $(this).data("action"))
    .on("mouseleave", ->
      $buttons_container.attr "data-hover-action", null)

    # $btn = $(this)
    # gesture = new Throw($btn.data "action")
    # gesture
