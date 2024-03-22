
class Player {
    float x = width*0.03;
    int value;
    boolean dealer = false;
    float money = 1000;
    int hand = 0;
    
    List<Integer> bets = new ArrayList<>();
    
    List<Card> currentHand;

    List<List<Card>> hands = new ArrayList<>();
    
    //0: not done. 1: won. 2: lost 3: draw 
    List<Integer> done = new ArrayList<>();
    List<Integer> outcomes = new ArrayList<>();
    
    public Player() {
      done.add(0);
      outcomes.add(0);
      bets.add(0);
      hands.add(new ArrayList<>());
      currentHand = hands.get(0);
    }
    
    public void incHand() {
      if (hand >= hands.size()-1) return;
      hand++;
      currentHand = hands.get(hand);
      setValue();
      if (!dealer) right.x = currentHand.get(currentHand.size()-1).x + currentHand.get(currentHand.size()-1).w * 1.02;
    }
    
    public void decHand() {
      if (hand <= 0) return;
      hand--;
      currentHand = hands.get(hand);
      setValue();
      if (!dealer) right.x = currentHand.get(currentHand.size()-1).x + currentHand.get(currentHand.size()-1).w * 1.02;
    }
    
    public void addHand() {
      currentHand = hands.get(hand);
      hands.add(new ArrayList<>());
      hands.get(hands.size()-1).add(currentHand.get(1));
      
      //in case of aceses
      
      if (currentHand.get(0).id == 14) currentHand.get(0).value = 11;
      if (currentHand.get(1).id == 14) currentHand.get(1).value = 11;
      
      //x get cards
      currentHand.get(1).x = this.x + round(2*(width+height)*0.02);
      Card temp = deck.remove(deck.size()-1);
      
      
      //x y
      temp.x = this.x + round(2*(width+height)*0.02);
      temp.y = height - temp.h - height*0.03;
      
      if (hands.get(hands.size()-1).size() > 0) {
        int last = hands.get(hands.size()-1).size()-1;
        temp.x = hands.get(hands.size()-1).get(last).x + temp.w/3;
      }
      hands.get(hands.size()-1).add(temp);
      currentHand.remove(1);
      add(deck.remove(deck.size()-1));
      
      
      done.add(0);
      outcomes.add(0);
      bets.add(bets.get(hand));
      money -= bets.get(hand);
    }

    public void add(Card card) {
      currentHand = hands.get(hand);
      card.x = this.x + round(2*(width+height)*0.02);
      card.y = height - card.h - height*0.03;
      if (dealer) card.y = height*0.03;
      if (currentHand.size() > 0) {
          card.x = currentHand.get(currentHand.size()-1).x + card.w/3;
      }
      if (!dealer) right.x = card.x + card.w * 1.02;
      hands.get(hand).add(card);
      setValue();
    }
    
    public void clearDeck() {
      while (hands.size() > 0) {
        List<Card> cards = hands.remove(hands.size()-1);
        while (cards.size() > 0) {
          playedCards.add(cards.remove(cards.size()-1));
        }
      }
      done = new ArrayList<>();
      done.add(0);
      outcomes = new ArrayList<>();
      outcomes.add(0);
      hands = new ArrayList<>();
      hands.add(new ArrayList<>());
      currentHand = hands.get(0);
      hand = 0;
    }

    public void show() {
        for (Card card: hands.get(hand)) {
            card.show();
        }
        //if (!dealer) {
        //  textAlign(LEFT, BOTTOM);
        //  text(value, x, height - 2.9*((height+width)*0.025) - height*0.03);
        //} else {
        //  textAlign(LEFT, TOP);
        //  text(value, x, height*0.03 + 2.9*((height+width)*0.025));
        //}
    }
    
    public void setValue() {
    currentHand = hands.get(hand);
    int sum = 0;
    this.value = 0;
    for (Card card : this.currentHand) {
      sum += card.value;
      if (sum > 21) {
        for (Card card2 : this.currentHand) {
          if (card2.value == 11) {
            card2.value = 1;
            sum -= 10;
            if (sum > 21) {
              continue;
            } else {
              break;
            }
          }
        }
      }
    }
    this.value = sum;
  }

}
