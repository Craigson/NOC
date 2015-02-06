PImage img;

FlakeSystem fs;
import java.util.Iterator; 

float count = 0;

PVector wind = new PVector(0.0005,0);

Timer timer = new Timer(150); //create a new timer object to create a new particle every 300millis

void setup (){
size(800,600);
fs = new FlakeSystem(); //initialise the particle system
img = loadImage("snow.png");
timer.start(); //start the timer
}

void draw(){
PVector gravity = new PVector(0,0.001);
background(0);
image(img,0,0);


if (timer.isFinished()){
  fs.addFlake();
  timer.start();
}

fs.applyForce(wind);
fs.applyForce(gravity);
fs.run();
count++;
println(frameRate + " " + fs.snowflakes.size());

}
