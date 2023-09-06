import java.util.Random;
class Animal {

  int xCoord;
  int yCoord;
  
  int healthPoints;
  int hungerPoints;
  int maturityPoints = 0;
  int birthAbilityPoints = 0;
  
  boolean isMale = false;
  boolean isFemale = false;
  
  
  Random rng = new Random();
  
  Animal(){
    
    //this randomly assigns a sex to the animal
    if (rng.nextInt(0,2) == 0){
    
      isFemale = true;
    
    }else{
    
      isMale = true;
    
    }
      

  
  }
  
  Animal(int xCoord, int yCoord){
    
    //this randomly a sex to the animal
    if (rng.nextInt(0,2) == 0){
    
      isFemale = true;
    
    }else{
    
      isMale = true;
    
    }
    
    setXCoord(xCoord);
    setYCoord(yCoord);
  
  }
  
  void randomWalk(){
    
    boolean canMove = false;
    
    while (canMove == false){
      //Radius of movement area is 30
      int degreesOfRotation = rng.nextInt(359);
      
      double degreesOfRotationInRadians = Math.toRadians(degreesOfRotation);
      
      int newXCoord = getXCoord() + (int)(Math.cos(degreesOfRotationInRadians)*30);
      int newYCoord = getYCoord() + (int)(Math.sin(degreesOfRotationInRadians)*30);
      
      if(newXCoord <= 1440 && newXCoord >= 0 && newYCoord <= 800 && newYCoord >= 0){
      
        setXCoord(newXCoord);
        setYCoord(newYCoord);
        canMove = true;
      }
      
    
      
    }    
  }
  
  void updatePoints(){
    
    this.healthPoints = this.healthPoints - 1;
    this.hungerPoints = this.hungerPoints - 3;
    this.maturityPoints++;
    this.birthAbilityPoints++;
    
  
  }
  
  
  //Getters and Setters
  
  void setXCoord(int xCoord){
  
    this.xCoord = xCoord;
  
  }
  
  void setYCoord(int yCoord){
  
    this.yCoord = yCoord;
  
  }
  
  int getXCoord(){
  
     return this.xCoord;
  
  }
  
  int getYCoord(){
  
     return this.yCoord;
  
  }

}
