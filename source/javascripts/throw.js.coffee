class window.Throw

  # class properties
  @possible_gestures:["rock","paper","scissors","lizard","spock"]

  # class methods
  @random_gesture:(exclude=null)->
    gesture
    loop
      gesture = @possible_gestures[Math.floor(Math.random()*@possible_gestures.length)]
      break if gesture != exclude
    gesture

  @create_random:(exclude=null)->
    new Throw Throw.random_gesture(exclude)


  # instance methods
  constructor:(@type=null)->
    @type ||= Throw.random_gesture()
    @beats = switch @type
      when "rock"     then ["scissors","lizard"]
      when "paper"    then ["rock","spock"]
      when "scissors" then ["paper","lizard"]
      when "lizard"   then ["paper","spock"]
      when "spock"    then ["rock","scissors"]

  does_tie:(other_throw)->
    return other_throw.type == @type

  does_beat:(other_throw)->
    return other_throw.type in @beats
