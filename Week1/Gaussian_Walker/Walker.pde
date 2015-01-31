class Walker {
 
  float x,y;
  float stepSize, choice;
  
  Walker(){
   x = width/2;
   y = height/2;
   stepSize = 0;
   choice = 0;
  }
  
  void step(){
  
  choice = random(0,1);
  float num = randomGaussian();
  float sd = 1;
  float mean = 2.5;
  float stepSize = num * sd + mean;
   
   if (choice < 0.25){
     x += stepSize;
   } else if (choice < 0.5){
     x -= stepSize;
   } else if (choice < 0.75){
     y += stepSize;
   } else {
     y -= stepSize;
  }
  
  }
  
  
  void display(){
    fill(0);
    ellipse(x,y,5,5);
  }
  
  
  
  
  
}
