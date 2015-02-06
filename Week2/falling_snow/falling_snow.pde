PImage img;

FlakeSystem fs;
import java.util.Iterator; 

float count = 0;

PVector windLeft = new PVector(-0.0005,0);
PVector windRight = new PVector(0.0005,0);

Timer timer = new Timer(50); //create a new timer object to create a new particle every 300millis

void setup (){
size(800,600);
fs = new FlakeSystem(); //initialise the particle system
img = loadImage("snow.png");
timer.start(); //start the timer
}

void draw(){
PVector gravity = new PVector(0,0.1);
background(20);
//image(img,0,0);


if (timer.isFinished()){
  fs.addFlake();
  timer.start();
}

fs.checkLocation(img);
float r = random(1);
if (r < 0.5){
fs.applyForce(windLeft);
} else {
  fs.applyForce(windRight);
}
fs.applyForce(gravity);
fs.run();
count++;
println(frameRate + " " + fs.snowflakes.size());
}
