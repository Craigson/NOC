//set a random chance of applying drag

PImage img;

FlakeSystem fs;
import java.util.Iterator; 

float count = 0;

PVector wind = new PVector(0.1,0); //create a wind vector to apply horizontal wind


Timer timer = new Timer(20);
Timer timer1 = new Timer(300);//create a new timer object to create a new particle every x-millis
Timer timer2 = new Timer(50);

void setup (){
size(1200,675, P2D);
fs = new FlakeSystem(); //initialise the particle system
img = loadImage("snow(1).png");
timer.start(); //start the timer
}

void draw(){
PVector gravity = new PVector(0,0.005); //create a universal gravity force
background(20);
//image(img,0,0);

blendMode(ADD);

//when the timer expires, add a flake, then restart the timer

if (timer.isFinished()){
  fs.addFlake();
  timer.start();
}

fs.checkLocation(img); //pass the PImage object into the checkLocation method to determine if the flake is over a letter
fs.applyForce(wind); //apply the horizontal wind force
fs.applyGravity(gravity); //apply the universal gravity force
fs.run(); //execute all the methods in the FlakeSystem class
// count++;
println(frameRate + " " + fs.snowflakes.size());
count++;
}
