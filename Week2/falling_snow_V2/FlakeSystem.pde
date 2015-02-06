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
    Iterator<Flake> itty = snowflakes.iterator();

    while (itty.hasNext ()) {
      Flake f = itty.next();
      f.run();
      if (f.isMelted()) {
        itty.remove();
      }
    }
  }

  void checkLocation(PImage img1) {
    for (Flake f : snowflakes) {
      color pixelColour = img1.get(int(f.loc.x), int(f.loc.y));
      // println(pixelColour);
      float r = random(1);
      if (pixelColour == -16777216 && r < 0.1) {
        f.isTrapped = true;
        // println(f.isTrapped);
      }
    }
  }


  void addFlake() {
    snowflakes.add(new Flake());
  }
}
