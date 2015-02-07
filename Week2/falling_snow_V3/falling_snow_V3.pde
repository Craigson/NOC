PImage img; //create the image object for trapping snow

FlakeSystem fs; //new particle system to contral snowflakes
import java.util.Iterator; 

PVector wind = new PVector(0.04,0); //create a wind vector to apply horizontal wind

WindChannel wc; //create a new random wind generator

Timer timer = new Timer(150); //set the timer to add particles every 150ms

void setup (){
noCursor(); //hide the mouse cursor
size(1200,675);
 
fs = new FlakeSystem(); //initialise the particle system
img = loadImage("snow(1).png"); //load the image into the system
timer.start(); //start the timer
wc = new WindChannel(); //initialise the random wind object3
}

void draw(){
PVector gravity = new PVector(0,0.003); //create a universal gravity force
background(20);
//comment out the image so that it doesn't get drawn to the screen
//image(img,0,0);


//when the timer expires, add a flake, then restart the timer
if (timer.isFinished()){
  fs.addFlake();
  timer.start();
}

wc.move(); //execute the windchannel's move method
wc.display(); //display the windchannel

fs.getWind(wc); //apply the getwind() method to the particle system, passing in the windchannel object as a parameter
fs.checkLocation(img); //pass the PImage object into the checkLocation method to determine if the flake is over a letter
fs.applyForce(wind); //apply the horizontal wind force
fs.applyGravity(gravity); //apply the universal gravity force
fs.run(); //execute all the methods in the FlakeSystem class

//use these for testing performance
println(frameRate + " " + fs.snowflakes.size());
//println(frameRate + " " + fs.snowflakes.size() + wc.windStrength);
}
