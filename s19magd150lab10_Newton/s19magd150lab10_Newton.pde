// Stores current camera eyeX
float x = width/2.0;
PImage img;
/*
*  Sets up window and loads texture
*/
void setup () {
  size(700, 700, P3D);
  noStroke();
  img = loadImage("texture.jpg");
}

void draw() {
    camera(x, height/2.0, height/2.0, width/2, height/2, 0.0, 
      0.0, 1.0, 0.0);
    background(0);
    // Add lighting
    directionalLight(255, 126, 126, 0, 0, -1);
    ambientLight(200, 100, 100,width/2,height/2,0);
    // Draw cube
    pushMatrix();
    translate(width/2 - 200, height/2, 0); 
    rotateY(0.5);
    box(100);
    popMatrix();
    // Draw custom shape
    pushMatrix();
    beginShape();
    texture(img);
    vertex(width/2, height/2, -50,25,25);
    vertex(width/2-50, height/2+51, -30,50,50);
    vertex(width/2+35, height/2+23, -10,100,100);
    vertex(width/2+12, height/2-23, 10,200,200);
    endShape();
    popMatrix();
    // Draw sphere
    pushMatrix();
    translate(width/2 + 200, height/2, 0);
    sphere(100);
    popMatrix();
}

// Move x coordinate of camera according to arrow key presses
void keyPressed() {
  if ( key == CODED) {
    if( keyCode == LEFT) {
      x += 100;
    } else if ( keyCode == RIGHT) {
      x -= 100;
    } else if ( keyCode == ENTER) {
      save("screen.jpg");
    }
  }
}


 
