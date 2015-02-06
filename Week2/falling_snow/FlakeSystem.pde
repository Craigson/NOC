class FlakeSystem {

  ArrayList <Flake> snowflakes;
  float numFlakes = 100;


  FlakeSystem() {
    snowflakes = new ArrayList<Flake>();
  }

  void applyForce(PVector force) {
    for (Flake f : snowflakes){
      PVector gravity = force.get();
      gravity.mult(f.mass);
      f.applyForce(gravity);
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

void checkLocation(PImage img1){
  for (Flake f : snowflakes){
  color pixelColour = img1.get(int(f.loc.x),int(f.loc.y));
  // println(pixelColour);
  if (pixelColour == -16777216){
    f.isTrapped = true;
  }
}
}

  void addFlake() {
    snowflakes.add(new Flake());
  }
  
}
