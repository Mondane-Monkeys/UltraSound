void setup() {
  size(700, 600);
}

void draw() {
  background(190);
  printToCanvas();
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


boolean[][] testEllipse(double Z) {
  final int resolution = 10; //number of pixels checks,
  final double zValue = Z;
  final double eX = 0;
  final double eY = 0;
  final double eZ = 0;
  final double eA1 = 0;
  final double eA2 = 0;
  final double eWidth = 1;
  final double eHeight = 2;
  final double eDepth = 1;

  final boolean[][] output = new boolean[resolution][resolution];
  for (int i = 0; i < resolution; i++) { //check X
    for (int j = 0; j < resolution; j++) { // check Y
      double checkX = i;
      double checkY = j;
      double checkZ = zValue;
      output[i][j] = inEllipse(checkX, checkY, checkZ, eX, eY, eZ, eDepth, eWidth, eHeight, eA1, eA2);
    }
  }
  return output;
}


void printToCanvas () {
  boolean [][] values = testEllipse (0);
  for (int i = 0; i < values.length; i++) {
    for (int j = 0; j < values[i].length; j++) {
      if (values[i][j]) {
        fill (0);
      } else {
        fill (255);
      }
      circle (i*5, j*5, 5);
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
