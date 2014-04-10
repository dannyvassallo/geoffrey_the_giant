class window.Throw
  beats: []

  constructor:(@type)->
    @beats = switch @type
      when "rock"     then ["scizzors","lizard"]
      when "paper"    then ["rock","spock"]
      when "scizzors" then ["paper","lizard"]
      when "lizard"   then ["paper","spock"]
      when "spock"    then ["rock","scizzors"]

  does_beat:(other_throw)->
    return other_throw.type in @beats
