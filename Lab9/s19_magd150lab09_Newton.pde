import processing.video.*;
import processing.sound.*;

PImage img;
Movie movie;
SoundFile sound;
Reverb reverb;

void setup() {
  size(500,500);
  background(0);
  img = loadImage("Tphoto.jpg"); //Loads in the image from processing folder 
  movie = new Movie(this, "tigervid.mov");
  movie.loop(); // Loads in video from data folder and puts it in a loop
  sound = new SoundFile(this, "sound.mp3");
  
  reverb = new Reverb(this); //Allows us to use reverb with our sound effect 
 
}

void draw() {
  image(img,0,height/3-75,250,150);
  image(movie, 0, (height*2)/3-75,250,150);
  pushMatrix();
  translate(250,0);
  scale(-1,1);
  tint(250,200,25);
  image(img,-250,height/3-75,250,150);
  image(movie, -250, (height*2)/3-75,250,150);
  popMatrix();
  tint(255);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if(key == ' ') {
    sound.play();
    reverb.process(sound); //Plays sound using space key 
  }
}
