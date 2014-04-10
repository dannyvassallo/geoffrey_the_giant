(function(){

  window.user     = new Player("You")
  window.opponent = new Player("Geoffrey")

  window.game     = new Game(user, opponent)
  game.on("throw", function(winner, loser){
    alert("Winner: " + winner.name)
  });

}());
