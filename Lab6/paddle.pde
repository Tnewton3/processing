class Paddle {
  int x,y;
  int yVel;
  // Constructor
  Paddle(int x, int y, int yVel) {
    this.x = x;
    this.y = y;
    this.yVel = yVel;
  }
  
  void move(int dir) {
    this.y += dir * yVel;
  }
  
  void draw() {
    fill(255);
    strokeWeight(0);
    rect(this.x,this.y,10,100);
  }
}
