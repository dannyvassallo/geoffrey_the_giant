$ ->
  $(".playgamebutton").css("visibility" , "hidden")
  $(".hidegame").css("display" , "none")


$ ->
  window.onYouTubePlayerAPIReady = ->
    player = new YT.Player("player",
      height: "360"
      width: "640"
      videoId: "PmrMhGUYdMY"
      events:
        onReady: onPlayerReady
        onStateChange: onPlayerStateChange
    )
    return
  window.onPlayerReady = (event) ->

  #/ event.target.playVideo(); 
  window.onPlayerStateChange = (event) ->
    if event.data is YT.PlayerState.PLAYING
      console.log "clicked play"
      $(".playgamebutton").css("visibility" , "visible")
    if event.data is YT.PlayerState.ENDED
      _gaq.push [
        "_trackEvent"
        "Videos"
        "Watch to End"
        player.getVideoUrl()
      ]
    return
  tag = document.createElement("script")
  tag.src = "https://www.youtube.com/player_api"
  firstScriptTag = document.getElementsByTagName("script")[0]
  firstScriptTag.parentNode.insertBefore tag, firstScriptTag
  player = undefined

$ ->
  $("[data-scroll-to]").click (e)->
    e.preventDefault()
    $("html, body").animate
      scrollTop: $($(this).data("scroll-to")).offset().top
    , 500



$ ->
  $(".playgamebutton").on "click", ->
    $(".hidegame").css "display", "visible"
    return

  return
