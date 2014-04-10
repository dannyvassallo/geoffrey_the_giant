window.Emittable =
  ee:null
  
  contsruct_emittable:()->
    @ee ||= new EventEmitter
    
