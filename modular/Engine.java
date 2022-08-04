public class Engine{

  
  //default rendering of grey screen
  public static color[][] render(Family family, double saggital, double coronal){//returns a 2d array of a scan at the given saggital/coronal coordinates;
  int SIZE = 100;
    color[][] scan = new color[SIZE][SIZE];
    for(int i=0; i < SIZE; i++){
       for(int j=0; j < SIZE; j++){
          scan[i][j] = new color(((5*i+j)*i)%255);
       }
    }
    
    return scan;
  }



//renders middle slice of child, no angles yet
public static color[][] render1(Family family, double saggital, double coronal){//returns a 2d array of a scan at the given saggital/coronal coordinates;
  int RESOLUTION = 100;
  double MAX_WIDTH = 5;
  double MAX_HEIGHT = 5;
  // double MAX_DEPTH = 1;
  Family testFam = new Family();
  Body body = new Body(family);
    color[][] scan = new color[RESOLUTION][RESOLUTION];
    for(int i=0; i < RESOLUTION; i++){
       for(int j=0; j < RESOLUTION; j++){
          Point pt = new Point((1.0*i/RESOLUTION*2*MAX_WIDTH)-MAX_WIDTH, (1.0*i/RESOLUTION*2*MAX_HEIGHT)-MAX_HEIGHT, 0);
          scan[i][j] = body.isIn(pt) ? new color(0) : new color(255);
       }
    }
    
    return scan;
  }
}















//general shapes -> 


class color{
  public color(int in) {
    super();
  }
}
