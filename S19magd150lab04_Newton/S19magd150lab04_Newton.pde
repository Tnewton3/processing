String[] toppings = new String[]{"Sauce", "Cheese", "Pepporoni", "Sausage"};
int currTopping = 0;
int pizzaX = 250;
int pizzaY = -50;
boolean animationOver = false;
void setup () {
  size(500,500);
  background (0,0,0);
  println("Press Arrow Keys To Cycle Toppings");
  println("Starting topping is sauce"); 
  fill(80,40,30);
  noStroke();
}

void draw () {
  if( !animationOver) {
    background(0);
    triangle (pizzaX - 150,pizzaY - 150,pizzaX + 150,pizzaY - 150,pizzaX,pizzaY + 150);
    pizzaY += 5;
    if (pizzaY >= height/2) {
      animationOver = true;
    }
  }
}

void keyPressed() {
  if(key == CODED)
  {
    if (keyCode == LEFT)
    {
      if (currTopping == 0) {
        currTopping = 3;
      } else {
        currTopping--;
      }
    }
    if(keyCode == RIGHT)
    {
      if (currTopping == 3) {
        currTopping = 0;
      } else {
        currTopping++;
      }
    } 
  }
  println("Topping: " + toppings[currTopping]);
}

void mousePressed() {
  if ( toppings[currTopping].equals("Sauce")) {
    fill(220,0,0);
    ellipse(mouseX,mouseY,75,75);
    
  } else if ( toppings[currTopping].equals("Cheese")) {
    fill(255,255,0);
    for ( int i = 0; i < 10; i++ ) {
      float x = (float)(mouseX + Math.random() * 40 - 20);
      float y = (float)(mouseY + Math.random() * 40 - 20);
      ellipse(x,y,15,15);
    }
  
  } else if ( toppings[currTopping].equals("Pepporoni")) {
    fill(150,0,0);
    ellipse(mouseX,mouseY,50,50);
  
  } else if ( toppings[currTopping].equals("Sausage")) {
      fill(150,50,50);
    ellipse(mouseX,mouseY,30,30);
  }
}
