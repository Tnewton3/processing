import processing.pdf.*;

String[] quotes;
int currQuote = 0;
int quoteFrame = 0;
int quoteFrameSwitch = 100;
PFont bodoni,franklin;
boolean save = false;
PImage background;

/*Sets up workspace
* Loads in fonts, text file, and background image
* Prints controls to console for user
*/
void setup() {
  size(480,720);
  bodoni = createFont("Bodoni MT Condensed", 24);
  franklin = createFont("Franklin Gothic Demi Cond", 64);
  quotes = loadStrings("quotes.txt");
  background = loadImage("background.jpg");
  println("Press 's' to save poster as a PDF\nUse the arrow keys to cycle movie quotes");
}
 
/* Handles drawing the poster
*  Calls functions to control quote cycling
*/
void draw() {
  if (save) {
    beginRecord(PDF, "Movie.pdf");
  }
  image(background, 0,0,width,height);
  textFont(franklin);
  textAlign(CENTER);
  fill(255,50,50);
  text("Torn", width/2, height - 32);
  drawQuotes();
  if(save) {
    endRecord();
    save = false;
  }

}


// Draws the quotes in the center of the screen
void drawQuotes() {
   textFont(bodoni);
   textAlign(CENTER);
   fill(255,50,50);
   text(quotes[currQuote], width/2, height/2 - 32);
}

/*Checks for key presses and reacts accordingly
* 'S' or 's' - Saves the current state of the poster as a PDF
* Left or right arrow keys - Cycles through the movie quotes
*/
void keyPressed() {
  if ( key == 's' || key == 'S'){
    save = true;
    println("Saving");
  } else if( key == CODED) {
    if( keyCode == LEFT) {
      currQuote--;
      if( currQuote < 0) {
        currQuote = quotes.length - 1;
      }
    } else if (keyCode == RIGHT) {
      currQuote++;
      if( currQuote > quotes.length - 1) {
        currQuote = 0;
      }
    }
  }
}
