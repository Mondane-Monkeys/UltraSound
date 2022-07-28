//Holds all information relating to the patient.

public class Family{
  //baby variables
  int age;
  int size;
  
  //family variables
  String medicalHistory;
  
  Family(){
    age = 10;
    size = 15;
    medicalHistory = null;
  }
  
  public int generateAge () {
    return int (random (4, 43));
  }
}
