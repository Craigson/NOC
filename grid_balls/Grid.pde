class Grid {
  
  //data -----------------
  
  float radius; //radius of each sphere
  int rows, cols; //number of rows and columns
  int w,h; //width and height of grid
  float zoff; //perlin noise argument for z offset
  float[][] z; //2D array to store the z-position of each sphere
  float spacingX, spacingY; // x/y distance between each sphere
  int xTranslate, yTranslate;
  //float totalWidth, totalHeight; //determining the layout of the grid
  
  //constructor -----------------
  Grid(float _radius, int _rows, int _cols, int _w, int _h){
    radius = _radius;
    rows = _rows;
    cols = _cols;
    w = _w;
    h = _h;
    zoff = 0.0;
    z = new float[cols][rows];
    xTranslate = (width-w)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-h)/2; //calculate the y-position of the top left sphere in the grid
    spacingX = w/cols;
    spacingY = h/rows;
  }
  //Methods -------------
  
  //calculate the z-value
  void update(){
    
  }
  
  void display(){
    fill(0);
    pushMatrix();
    translate(xTranslate,yTranslate, 0);
    for (int i = 0; i < cols - 1; i++){
      sphere(radius);
      translate(spacingX,0,0);
      for (int j = 0; j < rows -1; j++){
        
        
      }//end of j loop
    } //end of i for looop
    popMatrix();
  }
  
  void pulse(){
    
  }
    
  
  //draw spheres in a 2D grid, with all initial z-values equal to zero
  
  
  
}
