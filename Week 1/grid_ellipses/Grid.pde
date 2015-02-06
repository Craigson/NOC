class Grid {

  //data -----------------

  float radius; //radius of each sphere
  int rows, cols; //number of rows and columns
  int w, h; //width and height of grid
  float zoff; //perlin noise argument for z offset
  float[][] z; //2D array to store the z-position of each sphere
  float spacingX, spacingY; // x/y distance between each sphere
  int xTranslate, yTranslate; //variables to store the position of the top-left corner of the grid
  
  //constructor -----------------
  
  Grid(float _radius, int _rows, int _cols, int _w, int _h) {
    radius = _radius;
    rows = _rows;
    cols = _cols;
    w = _w;
    h = _h;
    zoff = 0.0;
    z = new float[cols][rows]; //create a 2D array of integers to store the radius values
    xTranslate = (width-w)/2; //calculate the x-position of the top left sphere in the grid
    yTranslate = (height-h)/2; //calculate the y-position of the top left sphere in the grid
    spacingX = w/(cols-1); //determine the horizontal space between each ellipse
    spacingY = h/(rows-1); //determine the vertical space between each ellipse
  }
  
  //Methods -------------

  //calculate the z-value (ie the radius) using perlin noise (borrowed from Shiffman's example)
  void update() {
        float xoff = 0;
    for (int i = 0; i < cols; i++)
    { 
      float yoff = 0;
      for (int j = 0; j < rows; j++)
      {
        z[i][j] = map(noise(xoff, yoff,zoff), 0, 1, 0, 20); // store the z values in a 2D array
        yoff += 0.05;
      }
      xoff += 0.05;
    }
    zoff+=0.1;
  }

  void display() {
    fill(0);
    //stroke(0);
    pushMatrix(); //main grid push
    translate(xTranslate, yTranslate, 0); //position the top left corner of the grid
   
   //iterate through the rows (number of rows is equal to the length of the z
   for (int i = 0; i < z.length; i++){
    pushMatrix();
    //iterate through the columns, drawing an ellipse and then translating down by the predefined spacing variable
    for (int j = 0; j < z[i].length; j++) {
      ellipse(0,0,z[i][j],z[i][j]);
      translate(spacingX, 0, 0);
    }
    popMatrix();
    translate(0,spacingY,0);

   }
    popMatrix(); //main grid pop

  }


}
