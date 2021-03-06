/*
Main:
 canvas setup
 controls handler (void keypressed())
 
 Patient:
 game data <- info shown explicity to user
 
 Baby:
 handles all isBaby(Point) calls
 holds baby dimension/position data
 relative X <- left to right
 relative Y <- head to toe
 relative Z <- front to back
 
 Point:
 contains X, Y, Z coordinates. 
 Used to pass data more elegantly
 
 Dimension
 Defines the size and dimensions of a shape
 Holds X, Y, Z, width, height, depth, angle1, angle 2
 Width <- stretches along X axis
 Height <- stretches along Y axis
 Depth <- stretches along Z axis
 angle1 <- rotates around X
 angle2 <- rotates around Y
 
 Shape
 abstract class
 includes isIn() method
 includes Parent shape
 includes dimensions (relative to parent point <- simply add parent (X,Y,Z,A1,A2)
 
 Ellipse <- (technically called ellipsoid)
 implents Shape
 
 Rectangle
 implements Shape
 */



int frame = 0;
void setup() {
  size(700, 600);
}

void draw() {
  background(190);

  Dimension dim = new Dimension (new Point (40, 50, 60), 0, 0, 40, 30, 50);
  Shape shape = new Ellipse (dim);
  for (int i = 0; i<4; i++) {
    printToCanvas((frame++%110), shape);
  }
}

//point is center
boolean inEllipse(double inputX, double inputY, double inputZ, double x, double y, double z, double length, double width, double height, double angle1, double angle2) {
  double pointX = x - inputX;
  double pointY = y - inputY;
  double pointZ = z - inputZ;
  if (((pointX*pointX)/(height*height) + (pointY*pointY)/(width*width) + (pointZ*pointZ)/(length*length)) < 1) {
    return true;
  } else {
    return false;
  }
}


boolean[][] testEllipse(double Z, Shape shape) {
  final int resolution = 100; //number of pixels checks,
  final double zValue = Z;
  final double eX = 40;
  final double eY = 50;
  final double eZ = 60;
  final double eA1 = 0;
  final double eA2 = 0;
  final double eWidth = 40;
  final double eHeight = 30;
  final double eDepth = 50;

  final boolean[][] output = new boolean[resolution][resolution];
  for (int i = 0; i < resolution; i++) { //check X
    for (int j = 0; j < resolution; j++) { // check Y
      double checkX = i;
      double checkY = j;
      double checkZ = zValue;
      Point point = new Point(checkX, checkY, checkZ);
      output[i][j] = shape.isIn(point);
    }
  }
  return output;
}


void printToCanvas (double z, Shape shape) {
  boolean [][] values = testEllipse (z, shape);
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values[i].length; j++) {
      if (values[i][j]) {
        fill (0);
      } else {
        fill (255);
      }
      circle (20+i*5, 20+j*5, 5);
    }
  }
}

class Patient {
  String patientName;
  char gender; //M (male), F (female) or I (intersex). 
  Baby fetus;
}

class Baby {
  //age of the baby, which by default is in days
  //can be converted to weeks and months through division.
  int days, weeks, months;

  /* NOTES BEGIN HERE: 
   * Body parts: head, torso, legs, arms, hands, feet, neck
   * Need to be able to give the exact location
   * Torso as centre/origin point. All other parts measured relative to that point. 
   * Torso origin point will need x, y, z plus angle measurements. 
   * All other parts will also have x y z and angle measurements
   * Torso also has anchor points. 
   */


  //Torso
  //head

  //arms
  //legs

  boolean checkPoint (double x, double y, double z) {
    //describe where the ellipse is
    final double eX, eY, eZ, eA1, eA2;
    //inEllipse();
    return false;
  }
  //point is a corner
  boolean inRect(double inputX, double inputY, double inputZ, double x, double y, double z, double length, double width, double height, double angle1, double angle2) {
    double pointX = x - inputX;
    double pointY = y - inputY;
    double pointZ = z - inputZ;
    if ((pointX > 0 && pointX < height) && (pointY > 0 && pointY < width) && (pointZ > 0 && pointZ < length)) {
      return true;
    } else {
      return false;
    }
  }


  void scan() {
  }

  void display () {
  }
}

/*
NOTES
 Angle1 = rotations around X
 Angle2 = rotation around Y
 Ellipse equation x^2/a^2 + y^2/b^2 + z^2/c^2 < 1
 X = centerX-inputX
 Y = centerY-inputY
 Z = centerZ-inputZ
 A = head height
 B = head width
 C = head depth
 1 = size
 Rect equation
 {0<X<height && 0<Y<width && 0<Z<depth}
 X = centerX-inputX
 Y = centerY-inputY
 Z = centerZ-inputZ
 */

//will scan and output to canvas

class Point {
  double x, y, z;

  public Point (double inputX, double inputY, double inputZ) 
  {
    x = inputX;
    y = inputY;
    z = inputZ;
  }
  public double getX() {
    return x;
  }
  public double getY() {
    return y;
  }
  public double getZ() {
    return z;
  }
}

class Dimension {
  Point point;
  double width, height, depth;
  double angle1, angle2;

  public Dimension (Point pt, double w, double h, double d, double ang1, double ang2) {
    point = pt;
    width = w;
    height = h;
    depth = d;
    angle1 = ang1;
    angle2 = ang2;
  }

  public double getX() {
    return point.getX();
  }
  public double getY() {
    return point.getZ();
  }
  public double getZ() {
    return point.getZ();
  }

  public double getWidth() {
    return width;
  }

  public double getHeight() {
    return height;
  }
  public double getDepth() {
    return depth;
  }
}

abstract class Shape {
  Shape parentShape;
  protected Dimension dims;

  public Shape(Shape parent, Dimension dim) {
    parentShape = parent;
    dims = dim;
  }
  
  public Shape (Dimension dim) {
    parentShape = null;
    dims = dim;
  }

  public abstract boolean isIn (Point input);
}


class Ellipse extends Shape {
  public Ellipse(Shape parent, Dimension dim) {
    super(parent, dim);
  }
  
  public Ellipse (Dimension dim) {
    super (dim);
  }
  
  public boolean isIn (Point input) {
    double pointX = super.dims.getX() - input.getX();
    double pointY = super.dims.getY() - input.getY();
    double pointZ = super.dims.getZ() - input.getZ();
    if (((pointX*pointX)/(super.dims.getHeight()*super.dims.getHeight()) + (pointY*pointY)/(super.dims.getWidth()*super.dims.getWidth()) + (pointZ*pointZ)/(super.dims.getDepth()*super.dims.getDepth())) < 1) {
      return true;
    } else {
      return false;
    }
  }
}


//TODO!!
/* class Rectangle extends Shape {
 } */
