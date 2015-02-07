class WindChannel {
  

  float w,h;
  PVector loc, vel, acc, noff;
  PVector windStrength;
  
 WindChannel(){
   loc = new PVector(width/2, height/2);
   vel = new PVector();
   acc = new PVector();
   windStrength = new PVector(random(-0.05, 0.05), random(-0.03,0));
   w = width/2;
   h = height/4;
   noff = new PVector(random(1000), random(1000));
 }
 
 void display(){
    rectMode(CENTER);
    //fill(255,20);
    noFill();
   rect(loc.x,loc.y,w,h);
 }
 
 PVector applyWind(Flake f){
   PVector pvec = new PVector(0,0);
   if (f.loc.x > loc.x - w/2 && f.loc.x < loc.x + w/2 && f.loc.y > loc.y - h/2 && f.loc.y < loc.y + h/2){
     return windStrength;
    // println("i'm inside");
   } else {
     return pvec;
     //println("im outside");
 }
 }
 
 
 
 void pulse(){
   
 }
 
 void move(){
    // acc.x = map(noise(noff.x), 0, 1, -1, 1);
    // acc.y = map(noise(noff.y), 0, 1, -1, 1);
    // acc.mult(0.1);

    // noff.add(0.01, 0.01, 0);

    // vel.add(acc);
    // vel.limit(1);
    // loc.add(vel);
    
    // if (loc.x > width){
    //   loc.x -= width;
    // } else if (loc.x < width){
    //   loc.x += width;
    // }
    
    // if (loc.y > height){
    //   loc.y -= height;
    // } else if (loc. y < 0){
    //   loc.y += height;
    // }
    
    loc.x = mouseX;
    loc.y = mouseY;
   
 }
 
 
}
