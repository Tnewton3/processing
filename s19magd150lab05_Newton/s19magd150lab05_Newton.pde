String currShape = "square";
int rectControlX = 380;     
int rectControlY = 540;
int circleControlX = 100;
int circleControlY = 540;
int rectSize = 25;     // Diameter of rect
int circleSize = 50;   // Diameter of circle
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(480,600);
}

void draw() {
  update(mouseX, mouseY);
  int currSize = 700;
  if ( currShape.equals("circle")) {
    String currColor = "white";
    noStroke();
    while(currSize > 0) {
      ellipse(240,240,currSize,currSize);
      if(currColor.equals("white")) {
        fill(0);
        currColor = "black";
      } else {
        fill(255);
        currColor = "white";
      }
      currSize-=10;
    }
  } else {
    String currColor = "black";
    while(currSize > 0) {
      rectMode(RADIUS);
      rect(240,240,currSize,currSize);
      if(currColor.equals("white")) {
        fill(0);
        currColor = "black";
      } else {
        fill(255);
        currColor = "white";
      }
      currSize-=10;
    }
  }
  //Draw controls
  fill(0);
  rect(0,600,480,120);
  stroke(255);
  ellipse(100,540,50,50);
  stroke(0);
  fill(255);
  rect(380,540,25,25);
  //Draw control labels
  fill(0);
  text("Squares", rectControlX - rectSize + 2, rectControlY + 5);
  fill(255);
  text("Circles", circleControlX - (circleSize / 2) + 5, circleControlY + 5);

}

void update(int x, int y) {
  if ( overCircle(circleControlX, circleControlY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectControlX, rectControlY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = false;
    rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currShape = "circle";
  }
  if (rectOver) {
    currShape = "square";
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x - (width) && mouseX <= x+( width) && 
      mouseY >= y - (height) && mouseY <= y+(height)) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
