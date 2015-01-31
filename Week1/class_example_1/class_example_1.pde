Walker walker1;

void setup(){
  size(800,600);
  walker1 = new Walker();
}


void draw(){
  background(255);
  walker1.step();
  walker1.checkEdges();
  walker1.display();
  
}
