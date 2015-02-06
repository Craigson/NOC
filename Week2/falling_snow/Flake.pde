class Flake {

  PVector loc, vel, acc;
  float mass, radius, lifespan, x, xoff;

  Flake() {
    loc = new PVector(random(-width/2, width), -10);
    mass = random(2, 10);
    radius = mass*0.8 ;
    acc = new PVector();
    vel = new PVector();
    lifespan = 2000;
    xoff = random(-.01, 0.1);
  }

  void run() {
    if (!isTrapped()) {
      update();
    }
    //  checkLocation();
    display();
    lifespan -= 0.3;
  }

  void update() {
    loc.add(vel);
    if (isTrapped()) {
      acc = new PVector(0, 0);
      vel = new PVector(0, 0);
    }
    vel.add(acc);
    acc.mult(0); //reset the acceleration every frame 
    //put the code for the dying particle here


    float r = random(1);
    if (r < 0.05) {
      xoff += 0.1;
    } else { 
      xoff += 0.005;
    }
    loc.x += map(noise(xoff), 0, 1, -0.5, 0.5);
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
