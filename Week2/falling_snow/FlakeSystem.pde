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

// void applyGravity(){
//   for (Flake f : snowflakes){
//     PVector gravity = new PVector(0,0.01*f.mass);
//   }
//}


  void addFlake() {
    snowflakes.add(new Flake());
  }
  
}
