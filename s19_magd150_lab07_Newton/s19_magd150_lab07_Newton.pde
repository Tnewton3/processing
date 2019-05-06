Tree[] forest = new Tree[50];
Player player;

void setup() {
  size(500,500);
  background (40,200,10);
  for(int i = 0; i < forest.length; i++) {
    forest[i] = new Tree();
  }
  player = new Player();
}

void draw() {
  background(40,200,10);
  for(int i = 0; i < forest.length; i++) {
    forest[i].draw();
  }
  player.draw();
  if (player.moveCount > 0) {
    player.move();
  }
}

void keyPressed() {
  if( key == CODED) {
    if ( keyCode == LEFT && player.moveCount == 0) {
      player.moveLeft();  
    } else if ( keyCode == RIGHT && player.moveCount == 0) {
      player.moveRight(); 
    } 
  }
}
