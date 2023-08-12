
class Grass{
  
  int xCoord;
  int yCoord;
  
  Grass(int xCoord, int yCoord){
  
    this.xCoord = xCoord;
    this.yCoord = yCoord;
  
  }
  
  void show(){
      
    fill(255, 0, 0);
    noStroke();
    rect(getXCoord(),getYCoord(),5,5);
    
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
