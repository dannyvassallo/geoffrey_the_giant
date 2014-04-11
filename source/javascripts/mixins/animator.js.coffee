window.Animator =
  
  # animate
  animate:($object, properties, options={})->
    $object.animate properties, $.extend(options, {queue: @queue})

  # delay the sequence
  delay:($object, duration=null)->
    $object.delay duration, @queue

  # queue a callback function to fire next in sequence
  enqueue:($object, callback)->
    $object.queue @queue, (next)->
      callback($object)
      next()
