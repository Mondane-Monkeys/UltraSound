 import java.util.*;

//Holds all information relating to the patient.

public class Family{
  //baby variables
  int age;
  double size;
  final double [] sizes = {1.6, 2.3, 3.1, 4.1, 5.4, 7.4, 8.7, 10.1, 11.6, 13.0, 14.2, 15.3, 16.4, 25.6, 26.7, 27.8, 28.9, 30.0, 34.6, 35.6, 36.6, 37.6, 38.6, 39.9, 41.1, 42.4, 43.7, 45.0, 46.2, 47.4, 48.6, 49.8, 50.7, 51.2, 51.7, 51.5, 51.3};
  
  //family variables
  String medicalHistory;
  
  Family(){
    age = generateAge();
    size = generateSize();
    medicalHistory = null;
  }
  
  Family(int inAge, double inSize){
    age = inAge;
    size = inSize;
    medicalHistory = null;
  }
  
  
  public int generateAge() {
    int ageToInt = (int) (Math.random()*(44-8)+8);
    return ageToInt;
    
  }
  
  public int generateSize() {
    return (int)sizes[age-8];
  }
  
}
