tag = document.createElement("script")
tag.src = "https://www.youtube.com/player_api"
firstScriptTag = document.getElementsByTagName("script")[0]
firstScriptTag.parentNode.insertBefore tag, firstScriptTag
player = undefined

window.onYouTubePlayerAPIReady = ->
  player = new YT.Player("player",
    height: "360"
    width: "640"
    videoId: "PmrMhGUYdMY"
    events:
      onReady: onPlayerReady
      onStateChange: onPlayerStateChange
  )
window.onPlayerReady = (event) ->

window.onPlayerStateChange = (event) ->
  if event.data is YT.PlayerState.PLAYING
    $(".btn-play-game").removeClass "hidden"
    _gaq.push [ "_trackEvent", "Buttons", "Clicked", "Play Video Button" ]
    Helpers.scroll_to $("#player-container")

  # if event.data is YT.PlayerState.ENDED

$ ->
  $(".btn-play-game").on "click", ->
    $("#game-container").removeClass "hidden"
    _gaq.push [ "_trackEvent", "Buttons", "Clicked", "Play Game Button" ]
  $("[data-scroll-to]").click (e)->
    e.preventDefault()
    $this = $(@)
    Helpers.scroll_to $($this.data("scroll-to"))
