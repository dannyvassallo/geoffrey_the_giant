window.Helpers =
  scroll_to: ($el, speed=400)->
    $("html, body").animate
      scrollTop: $($el).offset().top,
      speed

  preload_images: (url_array)->
    _(url_array).each (url)->
      window._pre_images = $('<img />').attr('src',url).addClass("img-preloading").appendTo('body').css
        position:   "absolute"
        left:       "-9999px"
        right:      "-9999px"
        visibility: "hidden"

  debug: ()->
    debug = true # toggle this
    return unless window.console && window.console.log && debug
    window.console.log arguments...

window.CSS =
  url:()->
    url = Array::slice.call(arguments,0).join("/").replace("//","/")
    "url(\"#{url}\")"
