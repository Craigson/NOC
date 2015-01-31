PVector loc;
PVector vel;
PVector acc;

void setup(){
  size(800,600);
  background(255);
  loc = new PVector(0,0);
  vel = new PVector(3,2.5);
  acc = new PVector(2,0);
}


void draw(){
  background(255);
  fill(0);
  loc.add(vel);
  ellipse(loc.x,loc.y,10,10);
  if (loc.x > width || loc.x < 0){
    vel.x *= -1;
  }
    if (loc.y > height || loc.y < 0){
    vel.y *= -1;
  }
  
  if (mouseClicked() == true){
    vel.add(acc);
  }
}
