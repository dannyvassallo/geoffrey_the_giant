class window.AnimatedElement extends Module

  constructor:(element, options={})->
    @options = $.extend {
      queue:      "fx"
      max_length: 200
      duration:   400
      properties: {}
    }, options

    @$el = $(element)

    @properties = @options['properties']
    for p,v of @properties
      @[p] = v

    @_timer = null

  indefinitely:(interval, fn)=>
    unless @_timer
      @_timer = setInterval =>
        Helpers.debug "indefinitely"
        @clearQueue()
        fn.apply(@)
      , interval
    return @

  interrupt:()=>
    Helpers.debug "interrupt"
    clearInterval(@_timer) if @_timer
    @clearQueue()
    @_timer = null
    return @

  clearQueue:(queue=null)=>
    queue ||= @options.queue
    @$el.finish(queue)
    return @

  # animate
  animate:(properties, options={})=>
    if @queue_full()
      @pop_queue()
    else
      @$el.animate properties, $.extend(@options, options)

    return @

  # delay the sequence
  delay:(duration=null, queue=null)=>
    duration  ||= @options.duration
    queue     ||= @options.queue

    if @queue_full()
      @pop_queue()
    else
      @$el.delay duration, queue

    return @

  # queue a callback function to fire next in sequence
  enqueue:(callback)=>
    if @queue_full()
      @pop_queue()
    else
      @$el.queue @options.queue, (next)=>
        callback(@$el)
        @dequeue()

    return @

  dequeue:(queue=null)=>
    queue ||= @options.queue
    @$el.dequeue(queue)
    return @

  queue_length:(queue=null)=>
    return @$el.queue(queue || @options.queue).length

  queue_full:()=>
    queue_full = @queue_length() >= @options.max_length
    Helpers.debug "queue full!! #{@queue_length()}" if queue_full
    return queue_full

  pop_queue:()=>
    @$el.stop(false, true)
    return @
