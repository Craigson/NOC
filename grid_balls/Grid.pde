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
  float vert;
  float[][] rad;
  PVector worldCenter;

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
    spacingX = w/(cols-1);
    spacingY = h/(rows-1);
    vert = 0;
    rad = new float[cols][rows]; //2D array to store radius values
    worldCenter = new PVector(0,0,0);
  }
  
  //Methods -------------

  //calculate the z-value (borrowed from Shiffman's example)
  void update() {
        float xoff = 0;
    for (int i = 0; i < cols; i++)
    { 
      float yoff = 0;
      for (int j = 0; j < rows; j++)
      {
       z[i][j] = map(noise(xoff, yoff,zoff), 0, 1, -100, 100);
       rad[i][j] = map(noise(xoff, yoff,zoff), 0, 1, 0, 15);
       
        yoff += 0.03;
      }
      xoff += 0.05;
    }
    zoff+=0.005;

  }

  void display() {
    fill(255);
    noStroke();
   // strokeWeight(0.25);
    sphereDetail(9);
    pushMatrix(); //main grid push
    translate(xTranslate, yTranslate, 0);
   
   for (int i = 0; i < z.length; i++){
    pushMatrix();
    for (int j = 0; j < z[i].length; j++) {
      pushMatrix();
      translate(0,0,z[i][j]);
      //sphere(radius);
      ellipse(0,0,rad[i][j],rad[i][j]);
      popMatrix();
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
