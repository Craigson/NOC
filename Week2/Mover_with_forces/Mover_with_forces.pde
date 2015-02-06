Mover[] movers;

void setup(){
  movers = new Mover[10];
  size(800,600);
  for (int i = 0; i < movers.length; i++){
    movers [i] = new Mover();
  }
}

void draw(){
  background(255);
  for (int i = 0; i < movers.length; i++){
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
  }
}
