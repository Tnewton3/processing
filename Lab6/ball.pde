class Ball {
  int x,y;
  int radius;
  int xVel, yVel;
  // Constructor
  Ball(int x, int y, int radius, int xVel, int yVel) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.xVel = xVel;
    this.yVel = yVel;
  }
  void move() {
    this.x += xVel;
    this.y += yVel;
    fill(255);
    strokeWeight(0);
    ellipse(this.x, this.y, radius * 2, radius * 2); 
  }
}
