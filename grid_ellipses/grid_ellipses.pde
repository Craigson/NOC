Grid griddle;

void setup() {
  size(800, 800, P3D);
  background(255);
  griddle = new Grid(4,40, 40, 700, 700);

}

void draw() {
  background(255);
  lights();
  camera();
  griddle.display();
  griddle.update();

}
