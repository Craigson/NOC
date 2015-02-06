class Flake {

  PVector loc, vel, acc; //create Pvectors for location, velocity and acceleration
  float mass, radius, lifespan;
  float x, xoff; //variables for perlin noise
  boolean isTrapped = false; //boolean variable for determining whether the flake is over a letter
 float c = 0.0001; //this is the drag co-efficient of the word

  Flake() {
    loc = new PVector(random(-width/2, width), -10); //initialise the flake above the window
    mass = random(2, 10);
    radius = mass*0.8 ;
    acc = new PVector();
    vel = new PVector();
    lifespan = 2000; //set the lifespan of the flake, it will be removed when this runs out
    xoff = random(-.01, 0.1); //random offset for incrementing perlin noise
  }

  void run() {
    //  checkLocation();
    update();
    display();
    lifespan -= 0.3; //reduce the lifespan of the flake every frame
  }


  void update() {
    
    if (isTrapped == true) { //if the flake is over a letter, apply a drag force
applyDrag();
acc = new PVector(0,0);
vel = new PVector(0,0);
    } else {
    loc.add(vel);
    vel.add(acc);
    }
    acc.mult(0); //reset the acceleration every frame 
    //put the code for the dying particle here

//if the random float r is less than 0.5, the increment is small, meaning a smaller movement horizontally
    float q = random(1);
    if (q < 0.05) {
      xoff += 0.1;
    } else { 
      xoff += 0.005;
    }
    if (isTrapped ==false){
    loc.x += map(noise(xoff), 0, 1, -0.5, 0.5); //adjust the x-location of the particle according to the noise value
  }
  }

//if the flake is "dead" set the boolean isMelted to true so that the system can remove the flake
  boolean isMelted() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }


  void display() {
    noStroke();
    fill(255, 220);
    ellipse(loc.x, loc.y, radius, radius);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }

  PVector applyDrag(){
    float speed = vel.mag(); //speed is the scalar value of the mover's velocity
    float dragMag = c*speed*speed; //the magnitude of the drag force is equivalent to the patch's
    //coefficient of friction multiplied by the square of the movers speed
    PVector drag = vel.get(); //get a copy of the movers direction
    drag.normalize(); //normalize to get the unit vector
    drag.mult(-1); //reverse the direction
    drag.mult(dragMag); //multiply the unit vector by the magnitude of the force
    return drag; //apply the new drag force to 'this' mover
  }
}
