class Grid {

  //data -----------------

  float radius; //radius of each sphere
  int rows, cols; //number of rows and columns
  float zoff; //perlin noise argument for z offset
  float[][] z; //2D array to store the z-position of each sphere
  float spacingX, spacingY; // x/y distance between each sphere
  int xTranslate, yTranslate; //variables for locating the top left corner of the grid
  float[][] rad; //2d array for storing the values for the radius
  int sphereFill; //the sphere's color
  int sphereRes; //variable to store the resolution of the sphere segments
  float amp; //variable for scaling the amplitude of the waves
  int gridSize; //variable for determing the size of the grid (ie. cols x rows)
  float incrementX; //value by which to increment x-offset
  float incrementY; //value by which to increment y-offset
  float incrementZ; //value by which to increment z-offset
  int range;

  //constructor -----------------
  Grid() {
    radius = 3;
    rows = 25;
    cols = 25;
    zoff = 0.0;
    sphereFill = 255;
    sphereRes = 3;
    amp = 100;
    gridSize = 500;
    xTranslate = (width-gridSize)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-gridSize)/2; //calculate the y-position of the top left sphere in the grid
    incrementX = 0.0;
    incrementY= 0.0;
    incrementZ = 0.0;
    range = 100;
  }

  //Methods -------------

  //calculate the z-value (borrowed from Shiffman's example)
  void update() {
    z = new float[rows][cols]; //update z-value every frame
    rad = new float[rows][cols]; //update radius value every frame
    xTranslate = (width-gridSize)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-gridSize)/2; //calculate the y-position of the top left sphere in the grid
    spacingX = gridSize/(cols-1); //update spacing value every frame
    spacingY = gridSize/(rows-1); //update spacing every frame
    float yy = incrementY; //update the increment value each frame before the nested loops
    float xx = incrementX; //update the increment value each frame before the nested loops
    float zz = incrementZ; //update the increment value each frame before the nested loops
    
    float xoff = 0.0;
    for (int i = 0; i < cols; i++)
    { 
      float yoff = 0.0;
      for (int j = 0; j < rows; j++)
      {
        z[i][j] = map(noise(xoff, yoff, zoff), 0, 1, -range, range);
        rad[i][j] = map(noise(xoff, yoff, zoff), 0, 1, 0, 15);

        yoff += yy; //increment y-offset
      }
      xoff += xx; //increment  x-offset
    }
    zoff+= zz; //increment z-offset
  }
  
  

  void display() {
    fill(sphereFill);
    noStroke();
    sphereDetail(sphereRes);
    pushMatrix(); //main grid push
    translate(xTranslate, yTranslate, 0);

    for (int i = 0; i < z.length; i++) {
      pushMatrix();
      for (int j = 0; j < z[i].length; j++) {
        pushMatrix();
        translate(0, 0, (z[i][j])*amp);
        sphere(radius);
        //  ellipse(0,0,rad[i][j],rad[i][j]);
        popMatrix();
        translate(spacingX, 0, 0);
      }
      popMatrix();
      translate(0, spacingY, 0);
    }
    popMatrix(); //main grid pop
  }

}
