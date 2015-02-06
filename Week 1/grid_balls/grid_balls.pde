Grid griddle; //declare the grid object

void setup() {
  size(800, 800, P3D);
  
  //initialise the grid object Grid(radius, rows, cols, width, height)
  griddle =  new Grid(3, 35, 35, 600, 600);
}

void draw() {
  lights(); //add lights to the scene
  background(0);
  camera(); //add a camera object
  rotateX(0.7); //rotate the scene 
  
  pushMatrix();
  griddle.display();
  griddle.update();
  popMatrix();

  println(frameRate);
}
