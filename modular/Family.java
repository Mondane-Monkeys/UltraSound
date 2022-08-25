 import java.util.*;

//Holds all information relating to the patient.

public class Family{
  //baby variables
  int age;
  double size;
  final double [] sizes = {1.6, 2.3, 3.1, 4.1, 5.4, 7.4, 8.7, 10.1, 11.6, 13.0, 14.2, 15.3, 16.4, 25.6, 26.7, 27.8, 28.9, 30.0, 34.6, 35.6, 36.6, 37.6, 38.6, 39.9, 41.1, 42.4, 43.7, 45.0, 46.2, 47.4, 48.6, 49.8, 50.7, 51.2, 51.7, 51.5, 51.3};
  final String [] firstNames = {"Elizabeth", "Grace", "Emily", "Madison", "Tiffany", "Chloe", "Jessica", "Lindsay", "Nicole", "Trinity", "Mikayla", "Leah", "Aaliyah", "Amber", "Danielle", "Lauren", "Talia", "Mackenzie", "Shelby", "Sabina", "Priya", "Parvati", "Priyanka", "Meilin", "Yuna", "Yufei", "Nayoung", "Nour", "Elle", "Kendra", "Rose", "Jensen", "Brynley", "Ryleigh", "Ashley", "Fatima", "Latifa", "Soraya", "Crystal", "Ariana", "Julia", "Michelle", "Sunny", "Taylor", "Diana", "Leslie", "Christina", "Charlotte", "Isabel", "Luisa", "Caitlin", "Paige", "Kendall", "Jordan", "Kiara", "Bianca", "Britney", "Jasmine", "Kira", "Sara", "Momo", "Sakura", "Yui", "Luna", "Blake", "Drew", "Alex", "Parker", "Brooklyn", "Emerson", "Charlie", "Cameron", "Logan", "Ryan", "Avery", "Jamie", "Camila", "Lucy", "Cassandra", "Kate", "Kelly", "Skylar", "Angel", "Natasha", "Olivia", "Abigail", "Uzo", "Yael", "Hannah", "Anna", "Lexi", "Naomi", "Elianna", "Carlie", "Joy", "Evelyn", "Mary", "Amanda", "Sarah"};
  final String [] lastNames = {}; 
  
  //family variables
  String medicalHistory;
  String firstName;
  String lastName; 
  
  Family(){
    age = generateAge();
    size = generateSize();
    medicalHistory = null;
    firstName = null;
    lastName = null;
  }
  
  Family(int inAge, double inSize){
    age = inAge;
    size = inSize;
    medicalHistory = null;
    firstName = null;
    lastName = null;
  }
  
  
  public int generateAge() {
    int ageToInt = (int) (Math.random()*(44-8)+8);
    return ageToInt;
    
  }
  
  public int generateSize() {
    return (int)sizes[age-8];
  }
  
  public int generateIndex () {
    return (int)(Math.random(1, 101));
  }
  
}
