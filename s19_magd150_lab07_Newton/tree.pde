class Tree {
  PVector location;
  PVector velocity;
  float treeScale = (float)Math.random() * .5 + 1.0;
  
  Tree() {
    location = new PVector(random(width),random(height));
    while(location.x < width/2+100 && location.x > width/2 - 100) {
      location.x = random(width);
    }
    velocity = new PVector(0, 2.5);
  }
  
  // Move trees and reset to top when off screen
  void move() {
    location.add(velocity);
    if( location.y >= height) {
      location.y = -50;
    }
  }
  
  // Draw tree in respect to random position
  void draw() {
    pushMatrix();
    translate(location.x,location.y);
    scale(treeScale);
    fill(153,76,0);
    rect(-10,55, 20, 30);
    fill(76,153,0);
    triangle(-40, 65, 0, 25, 40, 65);
    fill(102,204,0);
    triangle(-30, 40, 0, 10, 30, 40);
    fill(128,255,0);
    triangle(-20, 20, 0, 0, 20, 20);
    popMatrix();
    move();
  }
}
