Grid griddle;

void setup() {
  size(800, 800, P3D);
  background(255);
  griddle = new Grid(10,3, 3, 300, 300);
}

void draw() {
  background(255);
  lights();
  griddle.display();
  // translate(width/2,height/2,0);
  // sphere(10);
}
