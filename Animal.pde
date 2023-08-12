import java.util.Random;
class Animal {

  int xCoord;
  int yCoord;
  
  int healthPoints = 100;
  
  Random rng = new Random();
  
  Animal(){
    
    setXCoord((int)random(1,1439));
    setYCoord((int)random(1,799));
  
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
  
  void updateHealthLeft(){
    
    this.healthPoints = this.healthPoints - 1;
  
  }
  
  boolean checkIfDead(ArrayList<Bunny> bunnyList, int index){
  
    boolean isDead = false;
    
    if (bunnyList.get(index).healthPoints <= 0){
    
      bunnyList.remove(index);
      isDead = true;
      
    }
  
    return isDead;
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
