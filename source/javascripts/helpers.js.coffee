window.Helpers =
  scrollTo: ($el, speed=400)->
    $("html, body").animate
      scrollTop: $($el).offset().top,
      speed
