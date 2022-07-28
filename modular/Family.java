//Holds all information relating to the patient.

public class Family{
  //baby variables
  int age;
  double size;
  final double [] sizes = new double [37]; 
  
  //family variables
  String medicalHistory;
  
  Family(){
    age = generateAge();
    size = 15;
    medicalHistory = null;
  }
  
  public int generateAge() {
    return int (random (8, 44));
  }
  
  public int generateSize() {
    return 0; 
  }
  
  public void fillArray () {
    
  }
  
}
