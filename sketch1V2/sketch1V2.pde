final float ZOOM = 4;//Smaller is more zoomed in

float probeX = 0;
float probeY = -1*ZOOM/2;
float probeZ = -1*ZOOM/2;
float probeXAng = PI/2;
float probeYAng = PI/2;


void setup() {
   size(700, 600);
}

void draw() {
  background(190);
   drawInput();
   drawScan3();
}

void drawInput(){
  final int X = 50;
  final int Y = 450;
  final int WIDTH = 100;
  final int HEIGHT = 100;
  drawModelSide(X,Y,WIDTH,HEIGHT);
  drawProbeSide(X,Y,WIDTH,HEIGHT);
  drawModelTop(X+WIDTH,Y,WIDTH,HEIGHT);
  drawProbeTop(X+WIDTH,Y,WIDTH,HEIGHT);
}

void drawModelSide(float X, float Y, float WIDTH, float HEIGHT){
  noFill();
  stroke(0);
  rect(X,Y,WIDTH,HEIGHT);
  final float RESOLUTION = 100;
  final float RAD = 0.75;
  final float DIAM = 0.3;
  final float MIN = 0.3;
  final float MAX = PI-MIN;
  for(int i=0; i < RESOLUTION; i++){
    noStroke();
     fill(50);
     float angle = MIN + (i*(MAX-MIN))/RESOLUTION;
     float x = 1-RAD*sin(angle);
     float y = 1+RAD*cos(angle);
     circle(X+x*WIDTH/2,Y+y*HEIGHT/2,DIAM*WIDTH);
  }
}

void drawProbeSide(float X, float Y, float WIDTH, float HEIGHT){
  final int PROBE_LENGTH = 20;
  final int SIGHT_LENGTH = 100;
  
  float x = probeX*30+X+WIDTH/2;
  stroke(0);
  strokeWeight(10);
  line(x-PROBE_LENGTH*cos(probeXAng),Y-PROBE_LENGTH*sin(probeXAng),x,Y);
  
  strokeWeight(2);
  line(x+SIGHT_LENGTH*cos(probeXAng),Y+SIGHT_LENGTH*sin(probeXAng),x,Y);
}

void drawModelTop(float X, float Y, float WIDTH, float HEIGHT){
  noFill();
  stroke(0);
  rect(X,Y,WIDTH,HEIGHT);
  WIDTH/=3;
  HEIGHT/=3;
  final float RAD = 0.5;
  final float DIAM = 1;
  final float MIN = RAD;
  final float MAX = DIAM+RAD;
  noStroke();
  fill(50);
  circle(X+WIDTH*RAD, Y+1.5*HEIGHT, WIDTH*RAD*2);
  rect(X+WIDTH*RAD,Y+HEIGHT,2*WIDTH*RAD,2*WIDTH*RAD);
}

void drawProbeTop(float X, float Y, float WIDTH, float HEIGHT){
  final int PROBE_LENGTH = 5;
  final int SIGHT_LENGTH = 100;
  
  float x = probeX*30+X+WIDTH/2;
  float y = probeZ*20+Y+HEIGHT/2;
  stroke(0);
  strokeWeight(10);
  line(x-PROBE_LENGTH*cos(probeXAng),y-PROBE_LENGTH*sin(probeXAng),x,y);
  
  strokeWeight(2);
  line(x+SIGHT_LENGTH*cos(probeYAng),y+SIGHT_LENGTH*sin(probeYAng),x,y);
}


void keyPressed(){
  float smallInc = 0.1;
  float bigInc = 1;
  if(key == 'd'){
    probeX+=smallInc;
  } else if(key == 'D'){
    probeX+=bigInc;
  } else if(key == 'a'){
    probeX-=smallInc;
  } else if(key == 'A'){
    probeX-=bigInc;
  }
  
  if(key == 't'){
    probeXAng+=smallInc;
  } else if(key == 'T'){
    probeXAng+=bigInc;
  } else if(key == 'g'){
    probeXAng-=smallInc;
  } else if(key == 'G'){
    probeXAng-=bigInc;
  }
  
  if(key == 'r'){
    probeYAng+=smallInc;
  } else if(key == 'R'){
    probeYAng+=bigInc;
  } else if(key == 'f'){
    probeYAng-=smallInc;
  } else if(key == 'F'){
    probeYAng-=bigInc;
  }
  
  if(key == 'y'){
    probeY+=smallInc;
  } else if(key == 'Y'){
    probeY+=bigInc;
  } else if(key == 'h'){
    probeY-=smallInc;
  } else if(key == 'H'){
    probeY-=bigInc;
  }
  
  if(key == 's'){
    probeZ+=smallInc;
  } else if(key == 'S'){
    probeZ+=bigInc;
  } else if(key == 'w'){
    probeZ-=smallInc;
  } else if(key == 'W'){
    probeZ-=bigInc;
  }
  
  probeXAng=max(probeXAng, 0);
  probeXAng=min(probeXAng, PI);
  probeYAng=max(probeYAng, 0);
  probeYAng=min(probeYAng, PI);
  //println(probeYAng);
}

//Render engine
boolean isBaby(float x, float y, float z){
  final float mainDiam = 1;
  final float minorDiam = 0.5;
  if(x<0 && inTorus(x,y,z,mainDiam,minorDiam) && !inTorus(x,y,z,mainDiam,minorDiam/2)){
    return true;
  }
  return false;
}

boolean inTorus(float x, float y, float z, float mainDiam, float minorDiam){
  return sq(mainDiam - sqrt(x*x + y*y)) + z*z < minorDiam*minorDiam;
}

boolean isBaby2(float x, float y, float z){
  float dist = sqrt(x*x + y*y +z*z);
  if(dist<1 && dist > 0.5){
    return true;
  }
  return false;
}

void drawScan(){//no angles
  int gridSize = 200;
   int iterCount = 100;
   float min = -2;
   float max = 2;
   float range = max-min;
   for(int i=0; i < iterCount; i++){
     for(int j=0; j < iterCount; j++){
       float isX = probeX;
       float isY = min + (i*range/iterCount);
       float isZ = min + (j*range/iterCount);
       noFill();
       stroke(255);
        if(isBaby(isX, isY, isZ)){
          fill(0);
          noStroke();
        }
        circle(i*gridSize/iterCount, j*gridSize/iterCount, gridSize/iterCount);
     }
   }
}

void drawScan2(){//no angles
  int gridSize = 200;
   int iterCount = 100;
   float range = ZOOM;
   for(int i=0; i < iterCount; i++){
     for(int j=0; j < iterCount; j++){
       float I = (i*range/iterCount);
       float J = (j*range/iterCount);
       float isX = probeX+I*cos(probeXAng);
       float isY = probeY + I*sin(probeXAng);
       float isZ = probeZ + J;
       noFill();
       stroke(255);
        if(isBaby(isX, isY, isZ)){
          fill(0);
          noStroke();
        }
        circle(i*gridSize/iterCount, j*gridSize/iterCount, gridSize/iterCount);
     }
   }
}

//main function - does all the behind the scenes work 
void drawScan3(){//no angles
  int gridSize = 400;
   int iterCount = 100;
   float range = ZOOM;
   for(int i=0; i < iterCount; i++){
     for(int j=0; j < iterCount; j++){
       //all of the math that creates the plane. 
       //Goes through and checks if the point is inside or outside the scanning range. 
       float I = (i*range/iterCount);
       float J = (j*range/iterCount);
       float isX = probeX+I*cos(probeXAng) + J*cos(probeYAng);
       float isY = probeY + I*sin(probeXAng);
       float isZ = probeZ + J*sin(probeYAng);
       noFill();
       //if the point is, it is coloured to appear on the screen. Otherwise it isn't. 
       stroke(255);
        if(isBaby(isX, isY, isZ)){
          fill(0);
          noStroke();
        }
        //draws the circle 
        circle(j*gridSize/iterCount, i*gridSize/iterCount, gridSize/iterCount);
     }
   }
}

class Patient {
  String patientName;
  char gender; //M (male), F (female) or I (intersex). 
  Baby fetus;
}

class Baby { 
  int days, weeks, months;
  /* NOTES BEGIN HERE: 
  * Body parts: head, torso, legs, arms, hands, feet, neck
  * Need to be able to give the exact location
  * Torso as centre/origin point. All other parts measured relative to that point. 
  * Torso origin point will need x, y, z plus angle measurements. 
  */
}
