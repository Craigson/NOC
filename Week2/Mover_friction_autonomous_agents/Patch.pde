class Patch{
  
  float rad;
  PVector loc; //PVector to store the objects location
  float c; //co-efficient of drag
  
  Patch(){
    rad = random(10,75); //assign a random radius
    loc = new PVector(random(width),random(height)); //draw the patch in a random location
    c = random(0.01,0.05); //initialise it to a random value
  }
  
  //pass patch p into the function
  PVector calcDrag(Mover m){
    float speed = m.vel.mag(); //speed is the scalar value of the mover's velocity
    float dragMag = c*speed*speed; //the magnitude of the drag force is equivalent to the patch's
    //coefficient of friction multiplied by the square of the movers speed
    PVector drag = m.vel.get(); //get a copy of the movers direction
    drag.normalize(); //normalize to get the unit vector
    drag.mult(-1); //reverse the direction
    drag.mult(dragMag); //multiply the unit vector by the magnitude of the force
    return drag; //apply the new drag force to 'this' mover
  }
    
      boolean isInside(Mover m){

        PVector l = m.loc;
      float d = dist(loc.x,loc.y,l.x,l.y);
      
      //if the distance between the centers is less than the sum of the radii
      //the mover must be inside the patch
      if (d < rad + m.rad){
        return true;
      } else {
        return false;
      }
    }
  
    
  void display(){
    fill(0,20);
    noStroke();
    ellipse(loc.x,loc.y,rad*2,rad*2);
  }
  
}
