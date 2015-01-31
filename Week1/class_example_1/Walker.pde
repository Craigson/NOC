class Walker {

  //data
  float x, y;
  float xspeed, yspeed;
  float threshold;


  //constructor
  Walker() {
    x = width/2;
    y = height/2;
    threshold = 0;
  }


  //methods
  void step() {
    threshold = random(0, 1);

    // if (threshold < 0.25){
    // float xspeed = random(-2,2);
    // x += xspeed;
    // } else if (threshold > 0.25){
    // float yspeed = random(-2,2);
    // y += yspeed;
    // }

    if (threshold < 0.25) {
      y++;
    } else if (threshold < 0.5) {
      y--;
    } else if (threshold < 0.75) {
      x++;
    } else {
      x--;
    }
  }

void checkEdges() {
  if (x > width || x < 0) {
    xspeed = -xspeed;
  }

  if (y > height || y < 0) {
    yspeed = -yspeed;
  }
}

void display() {
  fill(0);
  ellipse(x, y, 10, 10);
}

}
