

//win/draw/lose

public void win() {
  player.money += player.bets.get(player.hand) * 2;
  player.bets.set(player.hand, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize((width)/25);
  text("YOU WIN", width/2, height/3);
}

public void winBlackJack() {
  player.money += player.bets.get(player.hand) * 2.5;
  player.bets.set(player.hand, 0);
  player.done.set(player.hand, 1);
  player.outcomes.set(player.hand, 1);
}

public void lose() {
  player.bets.set(player.hand, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize((width)/25);
  text("YOU LOSE", width/2, height/3);
}

public void draww() {
  player.money += player.bets.get(player.hand);
  player.bets.set(player.hand, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize((width)/25);
  text("DRAW", width/2, height/3);
}
