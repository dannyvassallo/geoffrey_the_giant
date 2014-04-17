class window.AnimatedElement extends Module

  constructor:(element, options={})->
    @options = $.extend {
      queue:      "fx"
      duration:   400
      properties: {}
    }, options

    @$el = $(element)

    @properties = @options['properties']
    for p,v of @properties
      @[p] = v

    @_timer = null

  indefinitely:(interval, fn)->
    if @_timer
      @_timer = setInterval =>
        fn.apply(@$el)
      , interval

  interrupt:()->
    clearInterval @_timer if @_timer
    @_timer = null

  # animate
  animate:(properties, options={})->
    @$el.animate properties, $.extend(@options, options)
    return @

  # delay the sequence
  delay:(duration=null, queue=null)->
    duration  ||= @options.duration
    queue     ||= @options.queue
    @$el.delay duration, queue
    return @

  # queue a callback function to fire next in sequence
  enqueue:(callback)->
    @$el.queue @options.queue, (next)=>
      callback(@$el)
      @dequeue()
    return @

  dequeue:(queue=null)->
    queue ||= @options.queue
    @$el.dequeue(queue)
    return @
