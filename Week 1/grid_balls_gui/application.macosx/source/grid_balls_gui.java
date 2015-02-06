import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import peasy.test.*; 
import peasy.org.apache.commons.math.*; 
import peasy.*; 
import peasy.org.apache.commons.math.geometry.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class grid_balls_gui extends PApplet {


//import processing.opengl.*;





ControlP5 cp5; //declare the controlp5 object
PeasyCam cam; //declare the peasy cam object

Grid griddle; //declare the grid object

int sphere_detail = 3; //set the initial value for the sphere's detail
int radius_size = 3; //set the initial radius size
int background_colour = 0; //set the initial background colour
int sphere_colour = 255; //set the initial sphere_colour
int grid_resolution = 25; //set the initial grid resolution
float amplitude = 1.25f; //set the initial amplitude
int grid_size = 500; //set the initial grid size
int vertical_range = 100; //set the range for vertical travel of each sphere
float x_Val = 0.03f; //set the value by which the x-value of noise() increments
float y_Val = 0.04f; //set the value by which the y-value of noise() increments
float z_Val = 0.005f; ////set the value by which the x-value of noise() increments

PFont f;

public void setup() {
  size(800, 800, P3D);
  cp5 = new ControlP5(this); //initialise the controlp5 object
  
  f = createFont("Arial", 12);
  textFont(f);
  
  
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
    
        //create a slider to control the dimensions of the grid
  cp5.addSlider("grid_size")
    .setPosition(width/2-50, 720)
    .setRange(100,1500)
    .setHeight(15)
    .setWidth(200);
   
//create a slider to control the amplitude of the waves
  cp5.addSlider("amplitude")
    .setPosition(width/2-50, 740)
    .setRange(0.25f,1.75f)
    .setHeight(15)
    .setWidth(200);
    
 //create a slider to control the vertical range
  cp5.addSlider("vertical_range")
    .setPosition(width/2-50, 760)
    .setRange(-300,300)
    .setHeight(15)
    .setWidth(200);
    

    
    //create a vertical slider to control the value by which the x-offset increases
  cp5.addSlider("x_Val")
     .setPosition(width-150,700)
     .setSize(15,80)
     .setRange(0.01f,0.1f);
     
    
      //create a vertical slider to control the value by which the y-offset increases
  cp5.addSlider("y_Val")
     .setPosition(width-100,700)
     .setSize(15,80)
     .setRange(0.01f,0.1f);
     
     
     //create a vertical slider to control the value by which the x-offset increase
  cp5.addSlider("z_Val")
     .setPosition(width-50,700)
     .setSize(15,80)
     .setDecimalPrecision(3)
     .setRange(0.001f,0.02f);
     
    
    
  griddle = new Grid();
 
  cp5.setAutoDraw(false); //don't draw the HUD automatically, instead call it manually in the gui() function
  
}

public void draw() {
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
  
  griddle.range = vertical_range;
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
public void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  fill(0,80);
  rect(5,675,width-10,120);
  cp5.draw(); //draw the controlP5 HUD
  fill(125);
  text("fps: " + frameRate, 10, 20); //draw the frameRate to the screen
  text("click+drag to rotate, scroll to zoom", 10, 32);
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
class Grid {

  //data -----------------

  float radius; //radius of each sphere
  int rows, cols; //number of rows and columns
  float zoff; //perlin noise argument for z offset
  float[][] z; //2D array to store the z-position of each sphere
  float spacingX, spacingY; // x/y distance between each sphere
  int xTranslate, yTranslate; //variables for locating the top left corner of the grid
  float[][] rad; //2d array for storing the values for the radius
  int sphereFill; //the sphere's color
  int sphereRes; //variable to store the resolution of the sphere segments
  float amp; //variable for scaling the amplitude of the waves
  int gridSize; //variable for determing the size of the grid (ie. cols x rows)
  float incrementX; //value by which to increment x-offset
  float incrementY; //value by which to increment y-offset
  float incrementZ; //value by which to increment z-offset
  int range; //variable for the range of vertical (z-direction) travel

  //constructor -----------------
  Grid() {
    radius = 3;
    rows = 25;
    cols = 25;
    zoff = 0.0f;
    sphereFill = 255;
    sphereRes = 3;
    amp = 100;
    gridSize = 500;
    xTranslate = (width-gridSize)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-gridSize)/2; //calculate the y-position of the top left sphere in the grid
    incrementX = 0.0f;
    incrementY= 0.0f;
    incrementZ = 0.0f;
    range = 100;
  }

  //Methods -------------

  //calculate the z-value (borrowed from Shiffman's example)
  public void update() {
    z = new float[rows][cols]; //update z-value every frame
    rad = new float[rows][cols]; //update radius value every frame
    xTranslate = (width-gridSize)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-gridSize)/2; //calculate the y-position of the top left sphere in the grid
    spacingX = gridSize/(cols-1); //update spacing value every frame
    spacingY = gridSize/(rows-1); //update spacing every frame
    float yy = incrementY; //update the increment value each frame before the nested loops
    float xx = incrementX; //update the increment value each frame before the nested loops
    float zz = incrementZ; //update the increment value each frame before the nested loops
    
    float xoff = 0.0f;
    for (int i = 0; i < cols; i++)
    { 
      float yoff = 0.0f;
      for (int j = 0; j < rows; j++)
      {
        z[i][j] = map(noise(xoff, yoff, zoff), 0, 1, -range, range);
        rad[i][j] = map(noise(xoff, yoff, zoff), 0, 1, 0, 15);

        yoff += yy; //increment y-offset
      }
      xoff += xx; //increment  x-offset
    }
    zoff+= zz; //increment z-offset
  }
  
  

  public void display() {
    fill(sphereFill);
    noStroke();
    sphereDetail(sphereRes);
    pushMatrix(); //main grid push
    translate(xTranslate, yTranslate, 0);

    for (int i = 0; i < z.length; i++) {
      pushMatrix();
      for (int j = 0; j < z[i].length; j++) {
        pushMatrix();
        translate(0, 0, (z[i][j])*amp);
        sphere(radius);
        //  ellipse(0,0,rad[i][j],rad[i][j]);
        popMatrix();
        translate(spacingX, 0, 0);
      }
      popMatrix();
      translate(0, spacingY, 0);
    }
    popMatrix(); //main grid pop
  }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "grid_balls_gui" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
