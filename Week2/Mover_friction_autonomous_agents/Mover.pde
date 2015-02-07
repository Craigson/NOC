class Mover {

  PVector loc, vel, acc, initForce;
  float mass;
  float rad;
  float maxSpeed, maxForce;
  color k;
  float g;
  

  Mover() {
    loc = new PVector(random(width),random(height));
    vel = new PVector(0, 0);
    mass = random (0.1,0.5);
    acc = new PVector(0,0);
    rad = mass*20;
    k = color (0);
    initForce = new PVector(random(-0.002,0.002),random(-0.002,0.002)); //give the mover an initial velocity
    maxSpeed = 3; //speed to which to limit the mover's velocity
    maxForce = 0.05; //maximum force steering force to be applied
    g = 350; //gravitational constant
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed); //limit the velocity of the mover
    loc.add(vel);
    acc.mult(0); //reset the acceleration at the end of every frame
    
  }

  void applyForce(PVector force) {

    PVector f = PVector.div(force, mass); //creace a copy of the original force
    acc.add(f);
  }
  
  
  void display() {
    float theta = vel.heading() + PI/2; //the triangle is drawn upright, so rotate by 90degrees
    fill(k);
    //draw the triangle for the mover
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape();
    vertex(0, -rad*1.3);
    vertex(-rad, rad*1.3);
    vertex(rad, rad*1.3);
    endShape(CLOSE);
    popMatrix();
    noFill();
    k = 0; //reset the colour to black at the end of every frame, this ensures
           //that the colour changes back to black when the movers leave the patch.
  }
    
    // ellipse(loc.x,loc.y,rad*2,rad*2);
    // k = 0;
 
  
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

void seek(PVector target){
  //create a new vector by subtracting the mover's location from the mouse's location
  //this is the direction in which the mover "would like to travel"
  PVector desired = PVector.sub(target,loc); 
  desired.setMag(maxSpeed); //set the magnitude according to the predefined maxspeed variable
  
  //create a new vector by subtracting the desired location from the current
  //velocity.  The resultant force will steer the mover toward the target location
  PVector steer = PVector.sub(desired,vel);
  steer.limit(maxForce); //limit the magnitude of the resultant vector for smoother/ more realistic motion
  applyForce(steer);
}

//the repel method causes the mover to apply a repulsion force to every mover in
//the environment
PVector repel(Mover m){
  
  PVector force = PVector.sub(loc,m.loc); //create a copy of the vector and get the direction
  float d = force.mag(); //get the magnitude of the computed vector
  //d = constrain(d,5.0,25.0);
  force.normalize(); //reduce it to a unit vector
  force.mult(-1); //reverse the direction for a repulsive force
  
  //the force strenght is determined by the universal strength of attraction
  float strength = (g * mass * m.mass) / (d * d);
  force.mult(strength); //multiply the unit vector by the computed strength
  return force;
}
  

}
