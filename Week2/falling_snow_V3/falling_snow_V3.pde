//set a random chance of applying drag

PImage img; //create the image object for trapping snow

FlakeSystem fs;
import java.util.Iterator; 

PVector wind = new PVector(0.04,0); //create a wind vector to apply horizontal wind

WindChannel wc;

Timer timer = new Timer(150);

void setup (){
  noCursor();
size(1200,675);
 
fs = new FlakeSystem(); //initialise the particle system
img = loadImage("snow(1).png");
timer.start(); //start the timer
wc = new WindChannel();
}

void draw(){
PVector gravity = new PVector(0,0.003); //create a universal gravity force
background(20);
//image(img,0,0);


//when the timer expires, add a flake, then restart the timer

if (timer.isFinished()){
  fs.addFlake();
  timer.start();
}

wc.move();
wc.display();

fs.getWind(wc);
fs.checkLocation(img); //pass the PImage object into the checkLocation method to determine if the flake is over a letter
fs.applyForce(wind); //apply the horizontal wind force
fs.applyGravity(gravity); //apply the universal gravity force
fs.run(); //execute all the methods in the FlakeSystem class
// count++;
//println(frameRate + " " + fs.snowflakes.size());
println(frameRate + " " + fs.snowflakes.size() + wc.windStrength);
}
