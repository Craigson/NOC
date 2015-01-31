void setup(){
  size(600,600);
  background(255);
}

void draw(){
  float sd = width/8;
  float mean = width/2;
  float x = randomGaussian()*sd + mean;
  fill(0,10);
  noStroke();
  ellipse(x, height/2,10,10);
}
