Mover [] movers;
Patch [] patches;
float count = 0;

void setup() {
  size(1200, 675);
  movers = new Mover[150]; //create an array of movers
  patches = new Patch[10]; //create an array of friction patches
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  for (int j = 0; j < patches.length; j++) {
    patches[j] = new Patch();
  }
}


void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY); //create a vector that stores the mouse location

  for (int i = 0; i < patches.length; i++) {
    patches[i].display();
  }

//check every mover against every other mover. Apply the force that's determined
//by the repel() method for every mover so that the movers repel one another
//and don't bunch together as they follow the mouse

  for (int j = 0; j < movers.length; j++) {
    for (int l = 0; l < movers.length; l++) {
      if (j!=l) { //mover musn't check against itself
        PVector force = movers[l].repel(movers[j]);
        movers[j].applyForce(force);
        //println(force);
      }
    }

    //loop through both each patch to check if the mover is over the patch,
    //if it is, execute the calcDrag method and apply the drag force
    for (int k = 0; k < patches.length; k++) {
      if (patches[k].isInside(movers[j]) == true) {
        movers[j].applyForce(patches[k].calcDrag(movers[j]));
        movers[j].k = color(100, 200, 100); //change the  colour if the mover is over the patch
      } else {
        movers[j].applyForce(movers[j].initForce); //if the mover is not within
        //the drag zone, apply the initial force assigned in the constructor
      }
    }
    movers[j].seek(mouse); //the seek() method takes the mouse position as a paramet and
                            //ensures that the movers steer towards the mouse
    movers[j].update();
    movers[j].checkEdges();
    movers[j].display();
  }

  println(frameRate);
}
