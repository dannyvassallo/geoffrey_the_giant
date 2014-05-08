class window.Social extends Module
  @extend
    PRIZES:[
        ["rock-paper-sissors-lizard-spock.mp3","http://soundcloud.com/"],
        ["iphone-backgrounds.zip","http://iphones.com/"],
        ["something-else.zip","http://last-thing.com/"]
      ]

  constructor:(el,@social)->
    @$el = $(el)

    @$prize_name = $download_modal.find(".prize-name")
    @$prize_link = $download_modal.find(".prize-link")

    @social ||= @$el.data("social")
    @bind_listeners()

  bind_listeners:()=>
    @$el.on "click", @popup_share

  unbind_listeners:()=>
    @$el.off "click"

  popup_share:(e)=>
    e.preventDefault()
    switch @social
      when "twitter"
        window.open(@twitter_url(), '_blank', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600')
        setTimeout @posted, 2500
      when "google"
        window.open(@google_url(), '_blank', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600')
        setTimeout @posted, 2500
      else
        FB.ui(@facebook_options(),@facebook_callback)

  posted:()=>
    @unbind_listeners()
    prize = Social.PRIZES.shift()
    @$prize_name.html prize[0]
    @$prize_link.attr "href", prize[1]
    share_modal.close()
    download_modal.open()
    @$el.addClass "disabled"
    @$prize_link.one "click", (=>download_modal.close())

  twitter_url:()=>
    "https://twitter.com/intent/tweet?" + 
      "url=#{encodeURIComponent(RPSLS.PAGE_URL)}&" + 
      "text=#{encodeURIComponent("blah blah blah")}&" + 
      "related=#{encodeURIComponent("geoffrythegiant:Follow The Giant")}"

  google_url:()=>
    "https://plus.google.com/share?url=#{RPSLS.PAGE_URL}"

  facebook_callback:(response)=>
    if response && !response.error_code
      @posted()

  facebook_options:()=>
    method:       "feed",
    link:         RPSLS.PAGE_URL,
    # picture     : share_data.image,
    name:         "Play Rock Paper Scissors Lizard Spock Against Me",
    caption:      "I just defeated The Giant and got to download his music FREE",
    description:  "description"
    
