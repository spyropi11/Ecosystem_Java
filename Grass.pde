
class Grass{
  
  int xCoord;
  int yCoord;
  
  Grass(int xCoord, int yCoord){
  
    this.xCoord = xCoord;
    this.yCoord = yCoord;
  
  }
  
  void show(){
      
    fill(43, 92, 39);
    //noStroke();
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
