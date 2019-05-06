Ball pongBall;
Paddle leftPaddle, rightPaddle;
int leftScore = 0;
int rightScore = 0;
int round = 0;

void setup() {
  // Prints game instructions to console if it is the first round
  if (round == 0) {
    println("Welcome to Pong!\nUse the 'W' and 'S' keys to control the left paddle\nUse the 'UP' and 'DOWN' keys to control the right paddle\nFirst to 5 points wins!");
  }
  size (900,600);
  background(0,0,0);
  pongBall = new Ball(width/2, height/2, 10, 5, 5);
  
  leftPaddle = new Paddle(20 - 5, height/2 - 50, 28);
  rightPaddle = new Paddle(width - 20 - 5, height/2 - 50, 28);
}

void draw() {
  background(0);
  update();
  stroke(255);
  strokeWeight(3);
  line (width/2,0,width/2,height);
}

void update() {
  // Check if ball is off screen or at border
  if( pongBall.x >= width || pongBall.x <= 0) {
    pongBall.xVel = -pongBall.xVel;
    pointOver();
  } 
  if( pongBall.y >= height - 10 || pongBall.y <= 10) {
    pongBall.yVel = -pongBall.yVel;
  } 
  
  checkHit();
  
  leftPaddle.draw();
  rightPaddle.draw();
  pongBall.move();
}

/*
*  Handles score when a ball passes a handle and checks if score is greater than 5.
*  If score is greater than 5 reset points for both teams and announce the winner.
*  Print current score.
*/
void pointOver() {
  if ( pongBall.x <= 0) {
    rightScore++;
  } else {
    leftScore++;
  }
  
  println("The score is: \n Left: " + leftScore + "\nRight: " + rightScore);
  
  if (rightScore == 5) {
    rightScore = 0;
    leftScore = 0;
    println("RIGHT WINS!");
  } else if(leftScore == 5) {
    rightScore = 0;
    leftScore = 0;
    println("LEFT WINS!");
  } 
  round++;
  setup();
}

/*
*  Checks if the ball is hitting one of the paddles and turns the ball around on contact.
*/
void checkHit() {
  // Check left paddle
  if ( pongBall.x - pongBall.radius >= leftPaddle.x && pongBall.x - pongBall.radius <= leftPaddle.x + 10 && pongBall.y <= leftPaddle.y + 100 && pongBall.y >= leftPaddle.y) {
    pongBall.xVel = -pongBall.xVel;
  // Check right paddle
  } else if (pongBall.x + pongBall.radius >= rightPaddle.x && pongBall.x + pongBall.radius <= rightPaddle.x + 10 && pongBall.y <= rightPaddle.y + 100 && pongBall.y >= rightPaddle.y) {
    pongBall.xVel = -pongBall.xVel;
  }
}
/*
*  Checks for 'W', 'S', 'UP', or 'DOWN' key presses and moves paddle accordingly.
*/
void keyPressed() {
  if(key == 'w' && leftPaddle.y > leftPaddle.yVel) {
    leftPaddle.move(-1);
  } else if(key == 's' && leftPaddle.y < height - leftPaddle.yVel - 100) {
    leftPaddle.move(1);  
  }
  if (key == CODED) {
    if (keyCode == UP && rightPaddle.y > rightPaddle.yVel) {
      rightPaddle.move(-1);
    } else if (keyCode == DOWN &&  rightPaddle.y < height - rightPaddle.yVel - 100) {
      rightPaddle.move(1);
    } 
  }
    
}
