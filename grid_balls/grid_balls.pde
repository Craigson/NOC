Grid griddle;

void setup() {
  size(800, 800, P3D);
  background(255);
  griddle = new Grid(4,10, 10, 300, 300);

}

void draw() {
  background(255);
  lights();
  griddle.display();

}
