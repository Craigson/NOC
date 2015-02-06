Mover [] movers;
Patch [] patches;
float count = 0;

void setup() {
  size(800, 600);
  movers = new Mover[2]; //create an array of movers
  patches = new Patch[2]; //create an array of friction patches
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  for (int j = 0; j < patches.length; j++) {
    patches[j] = new Patch();
  }
}


void draw() {
  background(255);

  for (int i = 0; i < patches.length; i++) {
    patches[i].display();
  }

  //loop through both arrays to check distance between
  //each mover and each patch
  for (int j = 0; j < movers.length; j++) {
    for (int k = 0; k < patches.length; k++) {
      if (patches[k].isInside(movers[j]) == true) {
        movers[j].applyForce(patches[k].calcDrag(movers[j]));
        movers[j].k = color(100, 200, 100);
        println(frameCount + " " + j + " " + "i'm inside");

        //println();
      } else {
        // movers[j].k = color(0);
        movers[j].applyForce(movers[j].initForce);
        println(frameCount + " " + j + " " + "Im outside");
      }

    }
          movers[j].update();
      movers[j].checkEdges();
      movers[j].display();
  }

  //println(frameRate);
}
