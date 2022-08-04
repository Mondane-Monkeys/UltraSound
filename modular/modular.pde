/*
  In modular.pde:
  setup & draw 
  game controls
  user interface
  
  In Family.java:
  holds all info about a patient and baby
  
  in engine.java:
  color[][] render(Family, double saggital, coronal);//returns a 2d array of a scan at the given saggital/coronal coordinates;
*/

////////////////////////////
///////main functions///////
////////////////////////////
void setup(){
  Family newExam = new Family ();
  size (800, 400);
}

void draw(){
  drawUI(); //should draw the game interface
}



////////////////////////////
//User interface functions//
////////////////////////////
void drawUI(){
  //TODO
  
  //draw the scanning table and object maybe? 
  
  //call the engine to draw the fetus, based on the calculations in family 
  /* color[][] scan = Engine.render (newExam, 0.0, 0.0);
    for (int i = 0; i < sizes.length; i++) {
      for (int j = 0; j < sizes.length; j++) {
        fill(scan[i][j]);
        circle(i, j, 3);
      }
    } */
  
  //draw a right hand box with some info on the baby and mother and measurements
  drawInfoBox(); 
  fillInfoBox(); 
}

/* void printToCanvas (double z, Shape shape) {
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
} */

void drawInfoBox () {
  stroke (0); 
  fill (200); 
  rect (600, 20, 180, 260); 
}

void fillInfoBox() {
  //to fill box with the information
  //name, age, weight of mother on top half 
  //age, gender (if known), and measurements of the baby 
  textSize (20); 
  fill (0);
  textAlign (CENTER);
  text ("Patient Name: ", 90, 40); 
  text ("Patient Age: ", 90, 80); 
  text ("Patient Weight: ", 90, 120); 
  text (" ", 90, 130);
  text (" ", 90, 150);
  text ("Fetus Gestation: ", 90, 180);
  text ("Fetus Sex: ", 90, 220); 
  text ("Fetus Length: " + ", Fetus Appx. Weight: ", 90, 250);
}


////////////////////////////
///game control functions///
////////////////////////////
void mouseClicked(){
}

void keyPressed(){
}
