

class Card {
    float x;
    float y;
    float w = 2*((height+width)*0.025);
    float h = 2.9*((height+width)*0.025);
    boolean faceUp = true;
    int id;
    int value;
    String symbol;
    String image;
    String back = "PNG-cards-1.3"+"/"+"back.png";

    public Card(int id, String sym, int value, String image) {
        this.id = id;
        this.value = value;
        this.symbol = sym;
        this.image = image;
    }

    public void show() {
        if (this.faceUp) {
            image(loadImage(this.image), this.x, this.y, this.w, this.h);
        } else {
            image(loadImage(this.back), this.x, this.y, this.w, this.h);
        }
    }


}
