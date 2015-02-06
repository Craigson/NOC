//snow flakes fall from the top of the screen
//move side-to-side using perlin noise
//image of the word "snow" is drawn to the screen, but not displayed
//when a flake goes over the colour, the force is applied. The idea being that the
//flakes accumulate to form the word "snow"
//horizontal wind blows in different regions.

PImage snowImg;


void setup (){
size(800,600);
snowImg = loadImage("snow.png");
}

void draw(){
  image(snow,0,0);
}
