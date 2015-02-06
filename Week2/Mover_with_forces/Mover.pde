class Mover {
 
  PVector loc;
  PVector vel;
  PVector mouse;
  PVector acc;
  float topspeed;
  
  Mover(){
    loc = new PVector(random(width),random(height));
    acc = new PVector(0.5,0.5);
    vel = new PVector(0,0);
    topspeed = 5;
  }
    
    void update(){
    mouse = new PVector(mouseX, mouseY);
    acc = PVector.sub(mouse, loc);
    vel.limit(topspeed);
    acc.normalize();
    acc.mult(0.1);
    loc.add(vel);
    vel.add(acc);
    acc.mult(0);
      
    }
    
    void display(){
     fill(0);
     ellipse(loc.x, loc.y, 5,5);
}

void checkEdges(){
  if (loc.x > width || loc.x < 0){
  vel.x *= -1;
}

if (loc.y > height || loc.y < 0 ){
  vel.y *= -1;
}

}
}
