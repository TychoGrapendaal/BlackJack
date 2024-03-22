import java.util.ArrayList;
import java.util.List;                   



String[][] perfectStratagieHard = {
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "doub", "doub", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"doub", "doub", "doub", "doub", "doub", "doub", "doub", "doub", "hit", "hit"},
  {"doub", "doub", "doub", "doub", "doub", "doub", "doub", "doub", "doub", "doub"},
  {"hit", "hit", "turnup", "turnup", "turnup", "hit", "hit", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "hit", "hit", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "hit", "hit", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "hit", "hit", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "hit", "hit", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"}
};

String[][] perfectStratagieSoft = {
  {"hit", "hit", "hit", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "hit", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "doub", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "hit", "doub", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"hit", "doub", "doub", "doub", "doub", "hit", "hit", "hit", "hit", "hit"},
  {"doubS", "doubS", "doubS", "doubS", "doubS", "turnup", "turnup", "hit", "hit", "hit"},
  {"turnup", "turnup", "turnup", "turnup", "doubS", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"},
  {"turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup", "turnup"}

};

String[][] perfectStratagieSplit = {
  {"split", "split", "split", "split", "split", "split", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"split", "split", "split", "split", "split", "split", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"dontSplit", "dontSplit", "dontSplit", "split", "split", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"split", "split", "split", "split", "split", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"split", "split", "split", "split", "split", "split", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"split", "split", "split", "split", "split", "split", "split", "split", "split", "split"},
  {"split", "split", "split", "split", "split", "dontSplit", "split", "split", "dontSplit", "dontSplit"},
  {"dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit", "dontSplit"},
  {"split", "split", "split", "split", "split", "split", "split", "split", "split", "split"}
};



PImage background;
List<Card> deck = new ArrayList<>();
List<Card> playedCards = new ArrayList<>();
Player player = new Player();
Player dealer = new Player();

List<Integer> askRunningCount = new ArrayList<>();


boolean nextRound = false;
boolean dealerTurn = false;

boolean bet = true;
boolean bet1 = false;
boolean betClick = true;

boolean outcome = false;


boolean notClick = true;
boolean notClick1 = false;
boolean notClick2 = false;

float decksLeft = 6;

color c = color(255, 0, 0);

Button hit;
Button stand;
Button doub;
Button split;
Button left;
Button right;
List<Chip> chips = new ArrayList<>();
List<Button> buttons = new ArrayList<>();


Button bett;
Button clear;

String answer = "";
boolean askingRunningCount = false;
boolean displayAnswer = false;

boolean delay = false;


float textSize = 0.5 * height + width/50;
float buttonWidth = round(5*(width+height)*0.1);
float buttonHeight = round(2*(width+height)*0.1);

void setup() {
    background = loadImage("background.jpg");
    dealer.dealer = true;
    
    for (int i = 0; i < 8; i ++) {
      askRunningCount.add(0);
    }
    
    askRunningCount.set(round(random(0, askRunningCount.size()-1)), 1);
    
    
    //buttons
    float spaceLeft = width - buttonWidth*4;
    hit = new Button(spaceLeft/5.0, height/2, buttonWidth, buttonHeight, c, "Hit");
    stand = new Button((spaceLeft/5.0)*2+buttonWidth, height/2, buttonWidth, buttonHeight, c, "Stand");
    doub = new Button((spaceLeft/5.0)*3+buttonWidth*2, height/2, buttonWidth, buttonHeight, c, "Double");
    split = new Button((spaceLeft/5.0)*4+buttonWidth*3, height/2, buttonWidth, buttonHeight, c, "Split");
    
    left = new Button(height*0.03, height - buttonHeight - height*0.03, buttonHeight, buttonHeight, c, "<");
    right = new Button(0, height - buttonHeight - height*0.03, buttonHeight, buttonHeight, c, ">");
    
    spaceLeft = width - buttonWidth*2;
    bett = new Button(spaceLeft/3, height/2, buttonWidth, buttonHeight, c, "Bet");
    clear = new Button((spaceLeft/3)*2 + buttonWidth, height/2, buttonWidth, buttonHeight, c, "Clear bet");
    buttons.add(hit);
    buttons.add(stand);
    buttons.add(doub);
    buttons.add(split);
    buttons.add(left);
    buttons.add(right);
    
    //chips
    spaceLeft = width - ((height+width)*0.05)*6;
    chips.add(new Chip(spaceLeft/7.0, height-height/4, 5, "chips"+ "/" + "5.png"));
    chips.add(new Chip((spaceLeft/7.0)*2 + ((height+width)*0.05), height-height/4, 10, "chips"+ "/" + "10.png"));
    chips.add(new Chip((spaceLeft/7.0)*3 + ((height+width)*0.05)*2, height-height/4, 25, "chips"+ "/" + "25.png"));
    chips.add(new Chip((spaceLeft/7.0)*4 + ((height+width)*0.05)*3, height-height/4, 50, "chips"+ "/" + "50.png"));
    chips.add(new Chip((spaceLeft/7.0)*5 + ((height+width)*0.05)*4, height-height/4, 100, "chips"+ "/" + "100.png"));
    chips.add(new Chip((spaceLeft/7.0)*6 + ((height+width)*0.05)*5, height-height/4, 500, "chips"+ "/" + "500.png"));

    fillDeck();
    
    shuffleDeck();
    shuffleDeck();
    

    //size(400, 1000);
    fullScreen();
}

//error two aces is a bust
//error the clear bet button does not look good

void draw() {

  image(background, 0, 0, width, height);
  
  
  if (delay) {
    delay(3000);
    delay = false;
  }
  
  
  
  if (player.value == 21 && player.currentHand.size() == 2) {
    winBlackJack();
    outcome = true;
    dealer.currentHand.get(1).faceUp = true;
    player.done.set(player.hand, 1);
    win();
  }
  
  if (player.done.get(player.hand) == 1) win();
  if (player.done.get(player.hand) == 2) lose();
  if (player.done.get(player.hand) == 3) draww();
  
  if (notClick2) {
    notClick = false;
    notClick2 = false;
  }
  
  
  
  if (notClick1) {
    delay(1000);
    notClick2 = true;
    notClick1 = false;
  }
  
  if (askingRunningCount) {
    textAlign(CENTER, CENTER);
    textSize((width)/25);
    text("WHAT IS THE RUNNING COUNT", width/2, height/3);
    text(answer, width/2, height/3 + (height+width)/25);
    displayAnswer = true;
  }
  
  if (!askingRunningCount && displayAnswer) {
    textAlign(CENTER, CENTER);
    textSize((width)/25);
    if (runningCount() == Integer.parseInt(answer)) {
      text("CORRECT", width/2, height/3);
    } else {
      text("WRONG THE RUNNING COUNT IS: " + runningCount(), width/2, height/3);
    }
    displayAnswer = false;
    delay = true;
  }
  
  //dealer logic
  if (dealerTurn) dealerTurn();
  
  if (outcome) outcome();
  
  //set up the next round
  if (nextRound) roundBlackJack();
  
  if (!bet1 && bet) betClick = true;
  
  //draw one extra round
  if (bet1 && bet) {
    delay(3000);
    bet1 = false;
  }
  
  
  if (bet) {
    showBet();
  } else {
    showCards();
  }
  
  if (bet1) {
    bet = true;
    
    player.bets = new ArrayList<>();
    player.bets.add(0);
    player.clearDeck();
    dealer.clearDeck();
  }
  
  fill(255);
  textSize((width)/40);
  textAlign(RIGHT, BOTTOM);
  text("Total money: " + player.money, width, height-height*0.05);
  
  runningCount();
  
  fill(255);
  textSize((width)/40);
  textAlign(CENTER, TOP);
  text("RUNNING COUNT: " + runningCount(), width/2, height*0.05 + (width)/50);
  
  
  
  
  if (player.done.get(player.hand) == 1) win();
  if (player.done.get(player.hand) == 2) lose();
  if (player.done.get(player.hand) == 3) draww();
}



public void showBet() {
  for (Chip c : chips) {
    c.show();
  }
  bett.show();
  clear.show();
  fill(255);
  textAlign(CENTER, CENTER);
  textSize((width)/20);
  text("Bet: " + player.bets.get(player.hand), width/2, height/3);
}

public void showCards() {
  for (Button b : buttons) {
    b.show();
  }
  fill(255);
  textSize((width)/40);
  textAlign(RIGHT, BOTTOM);
  text("Bet: " + player.bets.get(player.hand), width, height-height*0.05-(height+width)/50);
  
  player.show();
  dealer.show();  
  
  fill(255);
  textSize((width)/40);
  textAlign(RIGHT, CENTER);
  text("Decks left: " + decksLeft, width, height*0.02);
}

void mousePressed() {
  if (betClick) {
    if (bett.hit(mouseX, mouseY) && player.bets.get(0) > 0) {
      nextRound = true;
      bet = false;
      betClick = false;
    }
    if (clear.hit(mouseX, mouseY)) {
      player.money += player.bets.get(player.hand);
      player.bets.set(player.hand, 0);
    }
    for (Chip c : chips) {
      if (c.hit(mouseX, mouseY)) {
        int temp = player.bets.get(player.hand) + c.value;
        player.bets.set(player.hand, temp);
        player.money -= c.value;
      }
    }
    return;
  }
  
  
  
  if (nextRound) return;
  
  if (left.hit(mouseX, mouseY)) player.decHand();
  if (right.hit(mouseX, mouseY)) player.incHand();
  
  if (notClick) return;
  
  if (hit.hit(mouseX, mouseY)) hit();
  if (stand.hit(mouseX, mouseY)) stand();
  if (doub.hit(mouseX, mouseY)) doub();
  if (split.hit(mouseX, mouseY)) splitt();
  
}


public void dealerTurn() {
  print("dealer");
  if (dealer.currentHand.size() < 1) {
    print(dealer);
    print(dealer.hands);
    dealerTurn = false;
    return;
  }
  print("delaer1");
  if (dealer.currentHand.get(1).faceUp == false) {
    dealer.currentHand.get(1).faceUp = true;
    dealer.show();
    return;
  }

  
  if (dealer.value >= 17) {
    dealerTurn = false;
    outcome = true;
    return;
  }
  
  dealer.add(deck.remove(deck.size()-1));
  dealer.show();
}


public void outcome() {
  if (player.outcomes.get(player.hand) == 1) {
    for (Integer i : player.outcomes) {
      if (i == 0) return;
    }
    
    outcome = false;
    player.outcomes = new ArrayList<>();
    player.outcomes.add(0);
    bet1 = true;
    return;
  }
  
  if (player.value > 21) {
    player.outcomes.set(player.hand, 1);
    player.done.set(player.hand, 2);
    return;
  }
  
  if (dealer.value > 21) {
    player.done.set(player.hand, 1);
    win();
    player.outcomes.set(player.hand, 1);
  } else if (dealer.value >= 17 && dealer.value > player.value) {
    player.done.set(player.hand, 2);
    lose();
    player.outcomes.set(player.hand, 1);
  } else if (dealer.value >= 17 && dealer.value < player.value) {
    player.done.set(player.hand, 1);
    win();
    player.outcomes.set(player.hand, 1);
  } else if (dealer.value >= 17 && dealer.value == player.value) {
    player.done.set(player.hand, 3);
    draww();
    player.outcomes.set(player.hand, 1);
  }
  
  for (Integer i : player.outcomes) {
    if (i == 0) return;
  }
  
  outcome = false;
  player.outcomes = new ArrayList<>();
  player.outcomes.add(0);
  bet1 = true;
}


public int runningCount() {
  int runningCount = 0;
  for (Card c : playedCards) {
    if (c.id < 7) runningCount++;
    if (c.id > 9) runningCount--;
  }
  return runningCount;
}
