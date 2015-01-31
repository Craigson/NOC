class Walker {
  
 float x,y;
 float xstep,ystep;
 float xoff,yoff;
 
 Walker(){
   x = width/2;
   y = height/2;
   xoff = 0.01;
   yoff = 1000;
 }
   
   void walk(){
     xstep = map(noise(xoff),0,1,-1,1);
     ystep = map(noise(yoff),0,1,-1,1);
     x+=xstep;
     y+=ystep;
     
     xoff += 0.001;
     yoff += 0.001;
     
     if (x < 0){
       x += width;
     }
     
     if (x > width){
       x -= width;
     }
     if ( y <0){
       y += height;
     }
     if (y > height){
       y -= height;
     }
   }
   
   void display(){
     fill(0);
     ellipse(x,y,3,3);
   }
}
