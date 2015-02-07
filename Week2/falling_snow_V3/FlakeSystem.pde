class FlakeSystem {

  ArrayList <Flake> snowflakes; //arraylist of flakes

    FlakeSystem() {
    snowflakes = new ArrayList<Flake>();
  }

  //for every flake, apply the force divided by the mass of the object
  //this ensures different sized flakes are affected differently by forces applied to them
  void applyForce(PVector force) {
    for (Flake f : snowflakes) {
      PVector _f = PVector.div(force, f.mass); //Pass the vector by copy to leave the original unaltered
      f.applyForce(_f);
    }
  }

//for each flake, multiply by the mass to cancel out the acceleration due to gravity
//this ensurse each flake falls at the same rate
  void applyGravity(PVector force) {
    for (Flake f : snowflakes) {
      PVector gravity = force.get(); //create a copy of the vector
      gravity.mult(f.mass); //multiply the force by the objects mass (this cancels out mass)
      f.applyForce(gravity); //apply the gravity force
    }
  }

  void run() {
    //Create an iterator to go through the array list and remove "dead" particles
    Iterator<Flake> itty = snowflakes.iterator(); //a new iterator

    //while the iterator is not at the end, execute the following code
    while (itty.hasNext ()) {
      Flake f = itty.next();
      f.run();
      if (f.isMelted()) {
        
        //if the boolean isMelted (once at the end of its lifespan)
        //is set to true, remove the particle
        itty.remove(); 
      }
    }
  }

//this method checks the location of each flake, if the flake is over a part of the PImage
//that is black (color -16777216)
  void checkLocation(PImage img1) {
    for (Flake f : snowflakes) {
      
      //variable "pixelColour" is set according to the corresponding pixel
      //colour of the PImage at the flake f's x-and-y-locations
      color pixelColour = img1.get(int(f.loc.x), int(f.loc.y)); 
     
      // println(pixelColour); <- this was used to determine the value
      
      //create a float variable r and set it in a range between 0 and 1
      //5% of the time the flake's local boolean value for isTrapped is set to
      //true, this allows certain flakes to float past the image
      float r = random(1);
      if (pixelColour == -16777216 && r < 0.1) {
        f.isTrapped = true;
        // println(f.isTrapped);
      } else if (f.loc.y > height -5){
        f.isTrapped = true;
      }
    }
  }

//there is a checkLocation method inside the windChannel class
//that determines if the flake is inside, if it is, the
//applyMethod() function is executed
void getWind(WindChannel w){
  for (Flake f : snowflakes){
    f.applyForce(w.applyWind(f));
  }
}

//this method adds a new flake to the arraylist when it's called
  void addFlake() {
    snowflakes.add(new Flake());
  }
}
