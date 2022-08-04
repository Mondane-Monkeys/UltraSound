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

////////////////////////
//////////BODY//////////
///////////////////////
class Body extends Ellipse{
    Shoulder leftShoulder;
    Shoulder rightShoulder;
    public Body(Family family) {
        //default 20 weeks
        super(new Dimension(new Point(0, 0, 0), family.size, family.size/2, family.size/2, 0, 0));
        Dimension leftShoulderDim = new Dimension(new Point(0, family.size/2, 0), family.size/10, family.size/10, family.size/10, 0, 0);
        Dimension rightShoulderDim = new Dimension(new Point(0, -family.size/2, 0), family.size/10, family.size/10, family.size/10, 0, 0);
        leftShoulder = new Shoulder(family, leftShoulderDim, this);
        rightShoulder = new Shoulder(family, rightShoulderDim, this);
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input) || leftShoulder.isIn(input) || rightShoulder.isIn(input));
    }
}

////////////////////////
//////////ARMS//////////
///////////////////////
class Shoulder extends Ellipse{
    Shape parent;
    Bicep bicep;
    
    public Shoulder(Family family, Dimension dim, Shape inParent) {
        super(dim);
        parent = inParent;
        Dimension childDim = new Dimension(dim.point, family.size/10, family.size/2, family.size/10, dim.angle1, dim.angle2);
        bicep = new Bicep(family, childDim, this);
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input) || bicep.isIn(input));
    }
}

class Bicep extends Ellipse{
    Shape parent;
    Elbow elbow;
    
    public Bicep(Family family, Dimension dim, Shape inParent) {
        super(dim);
        parent = inParent;
        Point childPoint = new Point(dim.point.x, dim.point.y + family.size/2, dim.point.z);
        Dimension childDim = new Dimension(childPoint, family.size/10, family.size/10, family.size/10, dim.angle1, dim.angle2);
        elbow = new Elbow(family, childDim, this);
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input) || elbow.isIn(input));
    }
}

class Elbow extends Ellipse{
    Shape parent;
    Forearm forearm;
    
    public Elbow(Family family, Dimension dim, Shape inParent) {
        super(dim);
        parent = inParent;
        
        Dimension childDim = new Dimension(dim.point, family.size/10, family.size/2, family.size/10, dim.angle1, dim.angle2);
        forearm = new Forearm(family, childDim, this);
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input) || forearm.isIn(input));
    }
}

class Forearm extends Ellipse{
    Shape parent;
    Hand hand;
    
    public Forearm(Family family, Dimension dim, Shape inParent) {
        super(dim);
        parent = inParent;
        Point childPoint = new Point(dim.point.x, dim.point.y + family.size/2, dim.point.z);
        Dimension childDim = new Dimension(childPoint, family.size/10, family.size/10, family.size/10, dim.angle1, dim.angle2);
        hand = new Hand(family, childDim, this);
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input) || hand.isIn(input));
    }
}

class Hand extends Ellipse{
    Shape parent;
    
    public Hand(Family family, Dimension dim, Shape inParent) {
        super(dim);
        parent = inParent;
    }
    
    @Override
    public boolean isIn(Point input){
        return (super.isIn(input));
    }
}
