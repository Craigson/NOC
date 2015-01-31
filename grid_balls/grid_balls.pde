Grid griddle;
float theta = 0.0;

void setup() {
  size(800, 800, P3D);
  background(255);
  griddle = new Grid(5, 50, 50, 100, 100);
}

void draw() {
  lights();
  background(0);
  translate(0,0,-500);
  pushMatrix();
  rotateX(PI/3);
  griddle.display();
  popMatrix();
  griddle.update();
  println(frameRate);

}
