class Flake {

  PVector loc, vel, acc;
  float mass, radius, lifespan;

  Flake() {
    loc = new PVector(random(0, width), -10);
    mass = random(2,10);
    radius = mass*0.5;
    acc = new PVector();
    vel = new PVector();
    lifespan = 1000;
  }

  void run() {
    update();
    //  checkLocation();
    display();
  }

  void update() {
    loc.add(vel);
    if (isTrapped()){
      acc = new PVector(0,0);
      vel = new PVector(0,0);
    }
    vel.add(acc);
    acc.mult(0); //reset the acceleration every frame 
    //put the code for the dying particle here
    lifespan -= 1;
  }

  boolean isMelted() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }


  void display() {
    noStroke();
    fill(255, 126);
    ellipse(loc.x, loc.y, radius, radius);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }

  boolean isTrapped() {
    if (loc.y > height - 20) {
      return true;
  } else {
  return false;
}
}

}
