class Player {
  PVector location;
  int playerWidth = 25;
  float rotation = 0;
  int moveCount = 0;
  int direction = 0;
  int lane = 1;
  
  Player() {
    location = new PVector(width/2, height - 25);
  }
  
  // Draw player with respect to bottom lanes
  void draw() {
    pushMatrix();
    fill(100,0,0);
    rectMode(CENTER);
    translate(location.x,location.y);
    rotate(rotation);
    rect(0,0,playerWidth,playerWidth);
    popMatrix();
    rectMode(CORNER);
  }
  
  // Rotate and move based on direction until animation frames finish
  void move() {
    rotation += PI / 3.0 * direction;
    location.x += playerWidth / 2 * direction;
    moveCount--;
  }
  
  // Set up for animation moving to left lane
  void moveLeft() {
    if (lane > 0) {
      player.moveCount = 3;
      player.direction = -1;
      lane+=direction;
    }
  }
  
  // Set up for animation moving to right lane
  void moveRight() {
    if (lane < 2) {
      player.moveCount = 3;
      player.direction = 1;
      lane+=direction;
    }
  }
}
