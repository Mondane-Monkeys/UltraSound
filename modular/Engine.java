public class Engine{

  public static color[][] render(Family family, double saggital, double coronal){//returns a 2d array of a scan at the given saggital/coronal coordinates;
  int SIZE = 100;
    color[][] scan = new color[SIZE][SIZE];
    for(int i=0; i < SIZE; i++){
       for(int j=0; j < SIZE; j++){
          scan[i][j] = new color(155);
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
