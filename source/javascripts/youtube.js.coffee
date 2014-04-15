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
      _gaq.push [
        "_trackEvent"
        "Videos"
        "Play"
        player.getVideoUrl()
      ]
    console.log "clicked play"
    $(".invite-contest-body").addClass "showcontest"
    $(".contestdialog").addClass "contestdialoghidden"
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



