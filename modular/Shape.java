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

class Body {
    Shoulder leftShoulder;
    Shoulder rightShoulder;
    Ellipse primary;
    public Body(Family family) {
        //default 20 weeks
        primary = new Ellipse(new Dimension(new Point(0, 0, 0), family.size, family.size/2, family.size/2, 0, 0));
        
    }
}

class Shoulder extends Ellipse {
    Body body;
    Bicep forearm;
    
    public Shoulder() {
        super();
    }
}

class Bicep extends Ellipse{
    Shoulder shoulder;
    Elbow elbow;
    
}

class Elbow extends Ellipse{
    Bicep bicep;
    Forearm forearm;
    
}

class Forearm extends Ellipse{
    Hand shoulder;
    Elbow elbow;
    
}

class Hand extends Ellipse{
    Forearm forearm;
}
