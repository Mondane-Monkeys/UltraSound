//Holds all information relating to the patient.

public class Family{
  //baby variables
  int age;
  double size;
  
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
    if (age == 8) {
      return 1.6;
    } else if (age == 9) {
      return 2.3;
    } else if (age ) {
      
    }
  }
}
