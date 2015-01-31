Walker w;

void setup(){
  size(640,480);
  w = new Walker();
}

void draw(){
background(255);
w.step();
w.display();
}
