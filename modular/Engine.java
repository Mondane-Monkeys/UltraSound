public class Engine {

  //default rendering of grey screen
  public static int[][] render() {//returns a 2d array of a scan at the given saggital/coronal coordinates;
    int SIZE = 100;
    int[][] scan = new int[SIZE][SIZE];
    for (int i = 0; i < SIZE; i++) {
      for (int j = 0; j < SIZE; j++) {
        scan[i][j] = ((5 * i + j) * i) % 255;
      }
    }

    return scan;
  }

  //renders middle slice of child, no angles yet
  public static int[][] render1() {//returns a 2d array of a scan at the given saggital/coronal coordinates;
    int RESOLUTION = 100;
    double MAX_WIDTH = 50;
    double MAX_HEIGHT = 50;
    // double MAX_DEPTH = 1;
    Family testFam = new Family(10, 2.5);
    Body body = new Body(testFam);
    int[][] scan = new int[RESOLUTION][RESOLUTION];
    for (int i = 0; i < RESOLUTION; i++) {
      for (int j = 0; j < RESOLUTION; j++) {
        Point pt = new Point((1.0 * i / RESOLUTION * 2 * MAX_WIDTH) - MAX_WIDTH,
            (1.0 * i / RESOLUTION * 2 * MAX_HEIGHT) - MAX_HEIGHT, 0);
        scan[i][j] = body.isIn(pt) ? 0 : 255;
      }
    }

    return scan;
  }
  //general shapes -> 

  public static int[][] renderEllipse(double width, double height, double depth, int frame, int maxFrame) {
    int RESOLUTION = 100;
    double MARGIN = 0.9;
    Point pt = new Point(0, 0, 0);
    Dimension dim = new Dimension(pt, width * MARGIN, height * MARGIN, depth * MARGIN, 0, 0);
    Ellipse ellipse = new Ellipse(dim);
    //dimensions are radii
    //go from -depth -> depth: as frams go 0->maxFrame
    double z = ((1.0 * frame / maxFrame) - 0.5) * 2 * depth;//calculates which depth from the frame
    double x = 0;
    double y = 0;

    int[][] scan = new int[RESOLUTION][RESOLUTION];
    for (int i = 0; i < RESOLUTION; i++) {
      for (int j = 0; j < RESOLUTION; j++) {
        x = (1.0 * i / RESOLUTION) * 2 * width - width;//should go from -width -> width
        y = (1.0 * j / RESOLUTION) * 2 * height - height;//should go from -height -> height
        pt = new Point(x, y, z);
        scan[i][j] = ellipse.isIn(pt) ? 255 : 0;
      }
    }
    return scan;
  }
}
