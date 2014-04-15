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
    $(".playgamebutton").removeClass "hidden"
    
    Helpers.scrollTo $("#playercontainer")

  # if event.data is YT.PlayerState.ENDED

$ ->
  $(".playgamebutton").on "click", ->
    $("#game-container").removeClass "hidden"

  $("[data-scroll-to]").click (e)->
    e.preventDefault()
    $this = $(@)
    Helpers.scrollTo $($this.data("scroll-to"))
