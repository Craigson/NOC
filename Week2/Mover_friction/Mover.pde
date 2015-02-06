class Mover {

  PVector loc, vel, acc, initForce;
  float mass;
  float rad;
  color k;

  Mover() {
    loc = new PVector(random(width/2), random(height/2));
    vel = new PVector(0, 0);
    mass = random (0.1,0.5);
    acc = new PVector(0,0);
    rad = mass*20;
    k = color (0);
    initForce = new PVector(random(-0.002,0.002),random(-0.002,0.002));
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.limit(2);
  }

  void applyForce(PVector force) {

    PVector f = PVector.div(force, mass); //creace a copy of the original force
    acc.add(f);
  }
  
  
  void display() {
    fill(k);
    ellipse(loc.x,loc.y,rad*2,rad*2);
    k = 0;
  }
  
  void checkEdges(){
    if (loc.x < 0){
      loc.x += width;
    } else if (loc.x > width){
      loc.x -= width;
    }
    
    if (loc.y < 0){
      loc.y += height;
    } else if (loc.y > height){
      loc.y -= height;
    }
}

}
