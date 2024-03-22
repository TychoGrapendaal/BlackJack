class Chip {
  int value;
  String img; 
  float x;
  float y;
  float w = (height+width)*0.05;
  float h = (height+width)*0.05;
  public Chip(float x, float y, int value, String img) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.img = img;
  }
  
  public void show() {
    image(loadImage(img), x, y, w, h);
  }
  
  public boolean hit(int x, int y) {
    return (x >= this.x && x <= this.x+this.w && 
      y >= this.y && y <= this.y+this.h);
  }
}
