
class Bunny extends Animal{

  void show(){
      
    fill(135);
    noStroke();
    ellipse(getXCoord(),getYCoord(),15,15);
    
  }
  
  void checkForGrass(ArrayList<Grass> grassList){
  
    for(int i = 0; i < grassList.size(); i++){
      
      int differenceBetweenXCoords = (grassList.get(i).getXCoord() - this.getXCoord());
      int differenceBetweenYCoords = (grassList.get(i).getYCoord() - this.getYCoord());
      
      if (Math.abs(differenceBetweenXCoords) <= 30 && Math.abs(differenceBetweenYCoords) <= 30){
        
        grassList.remove(i);
        this.healthPoints++;
        println(this.healthPoints);
        
      }
      
      
    }
  
  }

}
