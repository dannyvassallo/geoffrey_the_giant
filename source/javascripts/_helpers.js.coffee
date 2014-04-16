window.Helpers =
  scroll_to: ($el, speed=400)->
    $("html, body").animate
      scrollTop: $($el).offset().top,
      speed

  preload_images: (url_array)->
    _(url_array).each (url)->
      $('<img />').attr('src',url).appendTo('body').css
        position: "fixed"
        left: "-999999999px"

