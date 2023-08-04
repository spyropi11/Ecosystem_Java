
import java.util.Random;
class Bunny {

  int xCoord;
  int yCoord;
  
  Random rng = new Random();
  
  Bunny(){
    
    setXCoord((int)random(0,1440));
    setYCoord((int)random(0,800));
  
  }
  
  void randomWalk(){
    
    //Radius of movement area is 5
    int degreesOfRotation = rng.nextInt(359);
    
    double degreesOfRotationInRadians = Math.toRadians(degreesOfRotation);
    
    setXCoord(getXCoord() + (int)(Math.cos(degreesOfRotationInRadians)*30));
    setYCoord(getYCoord() + (int)(Math.sin(degreesOfRotationInRadians)*30));
    
        
  }
  
  void show(){
    fill(255);
    noStroke();
    ellipse(getXCoord(),getYCoord(),15,15);
    
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
