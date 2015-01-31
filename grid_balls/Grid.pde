class Grid {

  //data -----------------

  float radius; //radius of each sphere
  int rows, cols; //number of rows and columns
  int w, h; //width and height of grid
  float zoff; //perlin noise argument for z offset
  float[][] z; //2D array to store the z-position of each sphere
  float spacingX, spacingY; // x/y distance between each sphere
  int xTranslate, yTranslate;
  //float totalWidth, totalHeight; //determining the layout of the grid
  int count;

  //constructor -----------------
  Grid(float _radius, int _rows, int _cols, int _w, int _h) {
    radius = _radius;
    rows = _rows;
    cols = _cols;
    w = _w;
    h = _h;
    zoff = 0.0;
    z = new float[cols][rows];
    xTranslate = (width-w)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-h)/2; //calculate the y-position of the top left sphere in the grid
    spacingX = w/cols-1;
    spacingY = h/rows-1;
    count = 0;
  }
  //Methods -------------

  //calculate the z-value
  void update() {
  }

  void display() {
    fill(0);
    pushMatrix(); //main grid push
    translate(xTranslate, yTranslate, 0);
   
   for (int j = 0; j < rows; j++){
    pushMatrix();
    for (int i = 0; i < cols; i++) {
      sphere(radius);
      translate(spacingX, 0, 0);
    }
    popMatrix();
    translate(0,spacingY,0);
   }
    popMatrix(); //main grid pop
    
    
  }

  void pulse() {
  }


  //draw spheres in a 2D grid, with all initial z-values equal to zero
}
