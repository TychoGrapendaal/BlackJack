class Button {
  float x,y,w,h;
  color c;
  String text;
  
  public Button(float x, float y, float w, float h, color c, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.text = text;
  }
  
  public void show() {
    strokeWeight(0);
    fill(c);
    rect(x,y,w,h);
    fill(0);
    textSize((w+h)/text.length());
    textAlign(CENTER, CENTER);
    text(text, x+w/2.0, y+h/3.0);
  }
  
  public boolean hit(int x, int y) {
    return (x >= this.x && x <= this.x+this.w && 
      y >= this.y && y <= this.y+this.h);
  }
}
