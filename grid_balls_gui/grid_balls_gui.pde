import controlP5.*;
//import processing.opengl.*;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

ControlP5 cp5; //declare the controlp5 object
PeasyCam cam; //declare the peasy cam object

Grid griddle; //declare the grid object

int sphere_detail = 3; //set the initial value for the sphere's detail
int radius_size = 3; //set the initial radius size
int background_colour = 0; //set the initial background colour
int sphere_colour = 255; //set the initial sphere_colour
int grid_resolution = 25; //set the initial grid resolution
float amplitude = 1.25; //set the initial amplitude
int grid_size = 500; //set the initial grid size
float x_Val = 0.03; //set the value by which the x-value of noise() increments
float y_Val = 0.04; //set the value by which the y-value of noise() increments
float z_Val = 0.005; ////set the value by which the x-value of noise() increments

void setup() {
  size(800, 800, P3D);
  cp5 = new ControlP5(this); //initialise the controlp5 object
  
  cam = new PeasyCam(this, 0, 0, 0, 600); //initialise the peasycam object
  cam.rotateX(-45); //set the camera's starting angle at 45 degrees
  cam.setMinimumDistance(300); //set minimum zoom distance
  cam.setMaximumDistance(1500); //set maximum zoom distance

//create a slider to control the sphere detail
  cp5.addSlider("sphere_detail")
    .setPosition(30, 700)
    .setRange(3,12)
    .setHeight(15)
    .setWidth(200);
    
//create a slider to control the radii of the spheres
  cp5.addSlider("radius_size")
    .setPosition(30, 720)
    .setRange(1, 30)
    .setHeight(15)
    .setWidth(200);
    
//create a slider to control the background colour
  cp5.addSlider("background_colour")
    .setPosition(30, 740)
    .setRange(0,255)
    .setHeight(15)
    .setWidth(200);
    
//create a slider to control the sphere fill
  cp5.addSlider("sphere_colour")
    .setPosition(30, 760)
    .setRange(0,255)
    .setHeight(15)
    .setWidth(200);
    
//create a slider to control the number of colums/width
  cp5.addSlider("grid_resolution")
    .setPosition(width/2-50, 700)
    .setRange(3,120)
    .setHeight(15)
    .setWidth(200);
   
//create a slider to control the amplitude of the waves
  cp5.addSlider("amplitude")
    .setPosition(width/2-50, 720)
    .setRange(0.25,1.75)
    .setHeight(15)
    .setWidth(200);
    
    //create a slider to control the dimensions of the grid
  cp5.addSlider("grid_size")
    .setPosition(width/2-50, 740)
    .setRange(100,1200)
    .setHeight(15)
    .setWidth(200);
    
    //create a vertical slider to control the value by which the x-offset increases
  cp5.addSlider("x_Val")
     .setPosition(width-150,700)
     .setSize(15,80)
     .setRange(0.01,0.1);
     
    
      //create a vertical slider to control the value by which the y-offset increases
  cp5.addSlider("y_Val")
     .setPosition(width-100,700)
     .setSize(15,80)
     .setRange(0.01,0.1);
     
     
     //create a vertical slider to control the value by which the x-offset increase
  cp5.addSlider("z_Val")
     .setPosition(width-50,700)
     .setSize(15,80)
     .setDecimalPrecision(3)
     .setRange(0.001,0.02);
     
    
    
  griddle = new Grid();
 
  cp5.setAutoDraw(false); //don't draw the HUD automatically, instead call it manually in the gui() function
  
}

void draw() {
  lights();
  background(background_colour);
  

  
  //disable the camera control if the mouse is over the HUD
  if (mouseY > 660){
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }

  pushMatrix();
  translate(-width/2, -height/2, 100); //position the grid so that it draws to the centre of the screen
  
  griddle.amp = amplitude;
  griddle.rows = grid_resolution;
  griddle.cols = grid_resolution;
  griddle.sphereRes = sphere_detail;
  griddle.sphereFill = sphere_colour;
  griddle.radius = radius_size; //set the size of the radius according to the slider
  griddle.gridSize = grid_size;
  griddle.incrementX = x_Val;
  griddle.incrementY = y_Val;
  griddle.incrementZ = z_Val;
  griddle.update();
  griddle.display();
  popMatrix();
  
  gui(); //call the gui() function to draw the HUD to the screen
  
  println(frameRate);
}

//create a gui function that draws the HUD over the 3D environment
void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  fill(0,80);
  rect(5,675,width-10,120);
  cp5.draw(); //draw the controlP5 HUD
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
