$ ->
  window.$share_modal     = $("#share-modal")
  window.$lost_modal      = $("#lost-modal")
  window.$download_modal  = $("#download-modal")

  window.share_modal      = $share_modal.remodal()
  window.lost_modal       = $lost_modal.remodal()
  window.download_modal   = $download_modal.remodal()

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
      "https://s3.amazonaws.com/myfangate.com/geoffrey/shake/frame1.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/shake/frame2.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/shake/frame3.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/shake/frame4.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/losing/frame1.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/losing/frame2.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/losing/frame3.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/losing/frame4.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frame1.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frame2.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frame3.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frame4.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/winning/frame5.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/throw_paper.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/throw_rock.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/throw_scissors.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/throw_spock.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/throw_lizard.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/lizardpaper.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/lizardspock.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/paperrock.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/paperspock.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/rocklizard.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/rockscissors.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/scissorspaper.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/scissorslizard.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/spockscissors.png"
      "https://s3.amazonaws.com/myfangate.com/geoffrey/starburst/spockrock.png"

    ]

    # $btn = $(this)
    # gesture = new Throw($btn.data "action")
    # gesture
