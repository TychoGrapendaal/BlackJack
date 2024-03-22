
//options

public void hit() {
  if (player.done.get(player.hand) != 0) return;
  player.add(deck.remove(deck.size()-1));
  if (player.value == 21) {
    stand();
    return;
  }
  if (player.value > 21) {
    
    lose();
    player.done.set(player.hand, 2);
    player.outcomes.set(player.hand, 1);
    for (Integer i : player.done) {
      if (i == 0) return;
    }
    dealer.currentHand.get(1).faceUp = true;
    notClick = true;
    bet1 = true;
    
    print(player.outcomes);
    
    for (Integer i : player.outcomes) {
      if (i == 0) {
        bet1 = false;
        dealerTurn = true;
        return;
      }
    }
    
    print(bet1);
    
    outcome = true;
    
  }
}


public void stand() {
  if (player.done.get(player.hand) != 0) return;
  player.done.set(player.hand, 5);
  for (Integer i : player.done) {
    if (i == 0) return;
  }
  notClick = true;
  dealerTurn = true;
}

public void doub() {
  if (player.done.get(player.hand) != 0) return;
  if(player.currentHand.size() > 2) return;
  player.done.set(player.hand, 5);
  
  //hit
  
  player.add(deck.remove(deck.size()-1));
  player.money -= player.bets.get(player.hand);
  if (player.value > 21) {
    
    lose();
    player.done.set(player.hand, 2);
    player.outcomes.set(player.hand, 1);
    for (Integer i : player.done) {
      if (i == 0) return;
    }
    dealer.currentHand.get(1).faceUp = true;
    notClick = true;
    bet1 = true;
    
    for (Integer i : player.outcomes) {
      if (i == 0) {
        bet1 = false;
        dealerTurn = true;
        return;
      }
    }
    
    outcome = true;
    return;
  }
  
  
  
  
  
  
  int temp = player.bets.get(player.hand) * 2;
  player.bets.set(player.hand, temp);
  
  
  //stand
  player.done.set(player.hand, 5);
  for (Integer i : player.done) {
    if (i == 0) return;
  }
  notClick = true;
  dealerTurn = true;
}

public void splitt() {
  if (player.done.get(player.hand) != 0) return;
  if (player.currentHand.size() > 2) return;
  if (player.currentHand.get(0).value != player.currentHand.get(1).value && player.currentHand.get(0).id != player.currentHand.get(1).id) return;
  player.addHand();
}
