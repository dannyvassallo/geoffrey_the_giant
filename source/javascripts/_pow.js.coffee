class window.Pow extends Module

  constructor: (element, options={})->
    @options = $.extend {
      show_animation:   "bounceIn"
      show_timing:      "ease-in-out"
      show_duration:    300

      hide_animation:   "fadeOut"
      hide_timing:      "linear"
      hide_duration:    400

      linger_duration:  800
    }, options

    @$el = $(element)
    @setup()

  show: ()=>
    @_before_show()
    return this

  hide: ()=>
    @_before_hide()
    return this

  _before_show: (e)=>
    Helpers.debug "_before_show"
    @$el
      .removeClass  "hidden"
      .animo {
        animation:  @options.show_animation
        duration:   @options.show_duration / 1000.0
        timing:     @options.show_timing
      }, @_after_show

  _after_show: (e)=>
    Helpers.debug "_after_show"

    if @options.linger_duration > 0
      setTimeout @hide, @options.linger_duration

  _before_hide: (e)=>
    Helpers.debug "_before_hide"
    @$el
      .animo {
        animation:  @options.hide_animation
        duration:   @options.hide_duration / 1000.0
        timing:     @options.hide_timing
      }, @_after_hide

  _after_hide: (e)=>
    Helpers.debug "_after_hide"
    @$el.addClass     "hidden"

  setup: ()->
    @$el.addClass "hidden"

