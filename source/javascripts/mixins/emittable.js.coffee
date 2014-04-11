window.Emittable =
  ee:null
  emittable:()->
    @ee ?= new EventEmitter
    
  on:()->
    @ee.on arguments...

  off:()->
    @ee.off arguments...

  trigger:()->
    @ee.trigger arguments...

  removeAllListeners:()->
    @ee.removeAllListeners arguments...

