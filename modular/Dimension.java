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
