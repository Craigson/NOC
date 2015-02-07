class Mover {

  PVector loc, vel, acc, initForce;
  float mass;
  float rad;
  color k;

  Mover() {
    loc = new PVector(width/2,height/2);
    vel = new PVector(0, 0);
    mass = random (0.1,0.5); //randomly assign mass to the mover
    acc = new PVector(0,0);
    rad = mass*20; //make the radius size a function of the mass
    k = color (0);
    initForce = new PVector(random(-0.002,0.002),random(-0.002,0.002)); //assign an initial
    //force that get's applied as the acceleration.  This will be applied whenever
    //the mover is outside of the patch
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.limit(2); //limit the velocity of the mover
  }

  void applyForce(PVector force) {

    //creace a copy of the original force and divide it by the mover's mass,
    //this means any acceleration applied will be influenced by the mass of the object
    PVector f = PVector.div(force, mass); 
    acc.add(f);
  }
  
  
  void display() {
    fill(k);
    ellipse(loc.x,loc.y,rad*2,rad*2);
    k = 0; 
  }
  
  //if the mover reaches the edge of the screen it reappears on the opposite side
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
