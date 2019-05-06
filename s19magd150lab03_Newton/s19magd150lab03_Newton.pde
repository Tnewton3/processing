int popped=0;
boolean bubblePopped=false; 
float bubbleX;
float bubbleY ;
float bubbleSize = 50;
int xDir =1; 
int yDir = 1;
int xVel = 7;
int yVel = 5;
void setup () {
  size(450,450);
  background(0);
  bubbleX = width/2;
  bubbleY = height/2; 
  println("Welcome to my Bubble Popper");
  println("Touch the bubble or let it get too big and it will pop!");
}
void draw() {
  background (0);
  if (!bubblePopped) {
      if (max(width, bubbleX) != width) {
        xDir= -1;
      } else if (min(0,bubbleX) != 0){
        xDir=1;
      }
      if (max(height, bubbleY) != height) {
        yDir =-1;
      } else if (min(0,bubbleY) != 0){
        yDir =1;
      }
       bubbleX= bubbleX+xDir*xVel;
       bubbleY= bubbleY+yDir*yVel;
       bubbleSize = bubbleSize + 0.85;
      
      ellipse (bubbleX,bubbleY,bubbleSize,bubbleSize);
      if(dist(bubbleX, bubbleY, mouseX, mouseY) <= bubbleSize / 2) {
        popped+=1;
        println("Bubbles Popped: " + popped);
        bubblePopped=true;
      } else if (bubbleSize >= width/2) {
        popped+=1;
        println("Bubbles Popped: " + popped);
        bubblePopped=true;
      }
  } else {
    bubblePopped=false;
    bubbleSize=50;
    bubbleX = width/2;
    bubbleY = height/2;
  }
}
