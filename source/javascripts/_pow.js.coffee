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

    @_after_show_triggered = false
    @_after_show_timer = setTimeout @_after_show, @options.show_duration

    @$el
      .removeClass  "hidden"
      .animo {
        animation:  @options.show_animation
        duration:   @options.show_duration / 1000.0
        timing:     @options.show_timing
      }, @_after_show

  _after_show: (e)=>
    return unless !@_after_show_triggered
    clearTimeout @_after_show_timer
    @_after_show_triggered = true

    Helpers.debug "_after_show"

    if @options.linger_duration > 0
      setTimeout @hide, @options.linger_duration

  _before_hide: (e)=>
    Helpers.debug "_before_hide"

    @_after_hide_triggered = false
    @_after_hide_timer = setTimeout @_after_hide, @options.hide_duration

    @$el
      .animo {
        animation:  @options.hide_animation
        duration:   @options.hide_duration / 1000.0
        timing:     @options.hide_timing
      }, @_after_hide

  _after_hide: (e)=>
    return unless !@_after_hide_triggered
    clearTimeout @_after_hide_timer
    @_after_hide_triggered = true

    Helpers.debug "_after_hide"
    @$el.addClass     "hidden"

  setup: ()->
    @$el.addClass "hidden"

