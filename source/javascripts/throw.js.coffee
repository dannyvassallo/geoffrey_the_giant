class window.Throw

  # class properties
  @possible_gestures:["rock","paper","scizzors","lizard","spock"]

  # class methods
  @random_gesture:()->
    @possible_gestures[Math.floor(Math.random()*@possible_gestures.length)]


  # instance properties
  beats: []

  # instance methods
  constructor:(@type=null)->
    @type ||= Throw.random_gesture()
    @beats = switch @type
      when "rock"     then ["scizzors","lizard"]
      when "paper"    then ["rock","spock"]
      when "scizzors" then ["paper","lizard"]
      when "lizard"   then ["paper","spock"]
      when "spock"    then ["rock","scizzors"]

  does_beat:(other_throw)->
    return other_throw.type in @beats
