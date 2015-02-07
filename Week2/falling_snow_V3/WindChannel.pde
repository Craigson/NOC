//this class creates a block of wind that moves around
//the window, when objects pass into the object, a force
//(windStrength) is applied to said objects

class WindChannel {
  
  float w,h; //the width and height of windchannel
  PVector loc, vel, acc, noff; //variables for controlling movement
  PVector windStrength; //the force to be applied
  
 WindChannel(){
   loc = new PVector(width/2, height/2);
   vel = new PVector();
   acc = new PVector();
   
   //assign a random PVector as the strenght of the wind
   windStrength = new PVector(random(-0.04, 0.004), random(-0.03,0));
   w = width/4;
   h = height/6;
   noff = new PVector(random(1000), random(1000)); //value used for incrementing noise
 }
 
 void display(){
    rectMode(CENTER);
   // fill(255,20);
    noFill();
   rect(loc.x,loc.y,w,h);
 }
 
 PVector applyWind(Flake f){
   PVector pvec = new PVector(0,0); //create a PVector with a value of (0,0)
   
   //if the flake is within the windChannel, apply the force of 
   //windspeed, else apply the null force
   if (f.loc.x > loc.x - w/2 && f.loc.x < loc.x + w/2 && f.loc.y > loc.y - h/2 && f.loc.y < loc.y + h/2){
     return windStrength;
   } else {
     return pvec;
 }
 }
 
 

//update the windchannel's position using noise
 void move(){
    acc.x = map(noise(noff.x), 0, 1, -2, 2);
    acc.y = map(noise(noff.y), 0, 1, -2, 2);
    acc.mult(0.1);

    noff.add(0.05, 0.05, 0);

    vel.add(acc);
    vel.limit(1);
    loc.add(vel);
    
    //constrain the windchannel's location within the window
    loc.x = constrain(loc.x,0,width);
    loc.y = constrain(loc.y,0,height);
 }
 
 
}
