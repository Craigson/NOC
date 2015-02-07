class Flake {

  PVector loc, vel, acc; //create Pvectors for location, velocity and acceleration
  float mass, radius, lifespan;
  float x, xoff; //variables for perlin noise
  boolean isTrapped = false; //boolean variable for determining whether the flake is over a letter
  float c = 0.0001; //this is the drag co-efficient of the word
  float theta, dTheta; //variables for rotating the polygon

  Flake() {
    loc = new PVector(random(-100, width), -10); //initialise the flake above the window
    mass = random(4, 10); //randomly assign a mass to the flake
    radius = mass*0.4 ; //the radius is a function of the mass
    acc = new PVector();
    vel = new PVector();
    lifespan = 2000; //set the lifespan of the flake, it will be removed when this runs out
    xoff = random(-.01, 0.1); //random offset for incrementing perlin noise
    theta = 0.0; //the angle of rotation
    dTheta = random (-0.07, 0.07); //set a random amount by which to increment theta and thus rotate the polygon
  }

  void run() {
    update();
    display();
    lifespan -= 0.1; //reduce the lifespan of the flake every frame
  }


  void update() {

    if (isTrapped == true) { //if the flake is over a letter, apply a drag force
      applyDrag();
      acc = new PVector(0, 0);
      vel = new PVector(0, 0);
    } else {
      loc.add(vel);
      vel.add(acc);
    }
    acc.mult(0); //reset the acceleration every frame 

    //this portion of code gives the snowflakes the subtle side-to-side motion
    //that gives them a more natural look, as if they were very light objects
    //experiencing air resistance as they fall to earth
    //if the random float r is less than 0.05, the increment is small, meaning a smaller movement horizontally
    float q = random(1);
    if (q < 0.05) {
      xoff += 0.1;
    } else { 
      xoff += 0.005;
    }
    
    //if the particle is free to move, ie not over the image, execute the following code
    if (isTrapped ==false) {
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
    fill(255, 245);
    // ellipse(loc.x, loc.y, radius, radius);
    pushMatrix();
    translate(loc.x, loc.y); //move the polygon to the new x-y location
    rotate(theta); //rotate the polygon by angle theta
    polygon(0, 0, radius, 5); //draw the pentagon
    popMatrix();
    //if the pentagon is free to move, ie not over the PImage
    //increment theta by dTheta
    if (isTrapped == false) {
      theta += dTheta;
    }
  }

  void applyForce(PVector force) {
    PVector f = force.get(); //make a copy of the force
    f.div(mass); //divide by the mass, this ensures the acceleration is affected by the objects mass
    acc.add(f); //add the force to the acceleration
  }

  PVector applyDrag() {
    float speed = vel.mag(); //speed is the scalar value of the mover's velocity
    float dragMag = c*speed*speed; //the magnitude of the drag force is equivalent to the patch's
    //coefficient of friction multiplied by the square of the movers speed
    PVector drag = vel.get(); //get a copy of the movers direction
    drag.normalize(); //normalize to get the unit vector
    drag.mult(-1); //reverse the direction
    drag.mult(dragMag); //multiply the unit vector by the magnitude of the force
    return drag; //apply the new drag force to 'this' mover
  }
  
  //create a polygon for drawing the snowflake as a pentagon
  void polygon(float x, float y, float radius, int npoints) {
    
     //the angle at which to draw the vertices is determined
     //by dividing 2PI (360 degrees) by the number of vertices
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius; 
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
