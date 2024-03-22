



//logic for the cards


public void roundBlackJack() {
  player.clearDeck();
  dealer.clearDeck();
  
  
  if (deck.size() < 50) {
    deck = new ArrayList<>();
    playedCards = new ArrayList<>();
    fillDeck();
  }
        
  player.add(deck.remove(deck.size()-1));
  
  dealer.add(deck.remove(deck.size()-1));
  
  player.add(deck.remove(deck.size()-1));
  
  Card temp = deck.remove(deck.size()-1);
  temp.faceUp = false;
  dealer.add(temp);
  
  
  nextRound = false;
  decksLeft = (deck.size() / 52.0);
  
  notClick1 = true;
  
  
  print("delaer: " + dealerTurn);
  
  
  //update the running count
  if (askRunningCount.size() < 0) {
    for (int i = 0; i < 8; i ++) {
      askRunningCount.add(0);
    }
    
    askRunningCount.set(round(random(0, askRunningCount.size()-1)), 1);
  }
  
  
  if (Math.random() < 0.1) {
    askRunningCount();
  }
}

public void askRunningCount(){
  if (askRunningCount.size() < 0) {
    for (int i = 0; i < 8; i ++) {
      askRunningCount.add(0);
    }
    
    askRunningCount.set(round(random(0, askRunningCount.size()-1)), 1);
  }
  //if (askRunningCount.remove(round(random(0, askRunningCount.size()-1))) == 0) return;
  
  askingRunningCount = true;
  fill(255);
  textAlign(CENTER, CENTER);
  textSize((width)/25);
  text("WHAT IS THE RUNNING COUNT", width/2, height/3);
  text(answer, width/2, height/3 + (height+width)/25);
  //openKeyboard();
}

void keyPressed() {
  if (askingRunningCount) {
    if (key == ENTER) {
      askingRunningCount = false;
      return;
    }
    if (key == BACKSPACE) {
      answer = answer.substring(0, answer.length()-1);
      return;
    }
    answer += key;
  }
}

public void shuffleDeck() {
  Card swap1;
  Card swap2;
  for (int i = 0; i < deck.size(); i++) {
      swap1 = deck.get(i);
      int index = round(random(deck.size() - 1));
      swap2 = deck.get(index);
      deck.set(i, swap2);
      deck.set(index, swap1);
  }
}

public void fillDeck() {
    for (int j = 0; j < 6; j++) {
        for (int i = 2; i < 11; i++) {
            deck.add(new Card(i, "clubs", i, "PNG-cards-1.3" + "/" + i + "_of_clubs.png"));
        }
        deck.add(new Card(11, "clubs", 10, "PNG-cards-1.3" + "/" + "jack_of_clubs2.png"));
        deck.add(new Card(12, "clubs", 10, "PNG-cards-1.3" + "/" + "queen_of_clubs2.png"));
        deck.add(new Card(13, "clubs", 10, "PNG-cards-1.3" + "/" + "king_of_clubs2.png"));
        deck.add(new Card(14, "clubs", 11, "PNG-cards-1.3" + "/" + "ace_of_clubs.png"));

        for (int i = 2; i < 11; i++) {
            deck.add(new Card(i, "hearts", i, "PNG-cards-1.3" + "/" + i + "_of_hearts.png"));
        }
        deck.add(new Card(11, "hearts", 10, "PNG-cards-1.3" + "/" +"jack_of_hearts2.png"));
        deck.add(new Card(12, "hearts", 10, "PNG-cards-1.3" + "/" +"queen_of_hearts2.png"));
        deck.add(new Card(13, "hearts", 10, "PNG-cards-1.3" + "/" +"king_of_hearts2.png"));
        deck.add(new Card(14, "hearts", 11, "PNG-cards-1.3" + "/" +"ace_of_hearts.png"));

        for (int i = 2; i < 11; i++) {
            deck.add(new Card(i, "diamonds", i, "PNG-cards-1.3" + "/" + i + "_of_diamonds.png"));
        }
        deck.add(new Card(11, "diamonds", 10, "PNG-cards-1.3" + "/" +"jack_of_diamonds2.png"));
        deck.add(new Card(12, "diamonds", 10, "PNG-cards-1.3" + "/" +"queen_of_diamonds2.png"));
        deck.add(new Card(13, "diamonds", 10, "PNG-cards-1.3" + "/" +"king_of_diamonds2.png"));
        deck.add(new Card(14, "diamonds", 11, "PNG-cards-1.3" + "/" +"ace_of_diamonds.png"));


        for (int i = 2; i < 11; i++) {
            deck.add(new Card(i, "spades", i, "PNG-cards-1.3" + "/" + i + "_of_spades.png"));
        }
        deck.add(new Card(11, "spades", 10, "PNG-cards-1.3" + "/" +"jack_of_spades2.png"));
        deck.add(new Card(12, "spades", 10, "PNG-cards-1.3" + "/" +"queen_of_spades2.png"));
        deck.add(new Card(13, "spades", 10, "PNG-cards-1.3" + "/" +"king_of_spades2.png"));
        deck.add(new Card(14, "spades", 11, "PNG-cards-1.3" + "/" +"ace_of_spades.png"));
    }
}
