import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


Grid griddle;
PeasyCam cam;

void setup() {
  size(800, 800, P3D);

  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(1000);

  //cam.setSuppressRollRotationMode();
  griddle = new Grid(5, 60, 60, 700, 700);
}

void draw() {
  lights();
  background(0);
 

  // Change height of the camera with mouseY
  pushMatrix();
  translate(-width/2, -height/2, 0);
  griddle.display();
  griddle.update();
  popMatrix();

}
