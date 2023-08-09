
class Bunny extends Animal{

  void show(){
      
    fill(135);
    noStroke();
    ellipse(getXCoord(),getYCoord(),15,15);
    
  }
  
  void checkForGrass(ArrayList<Grass> grassList){
    //Future issue --> this allows for a bunny to eat grass in chain reaction fashion, if it moves to one piece of grass it 
    //has now changed its coordinates, so that the next time it checks for grass if it has moved closer to another piece
    //it can then eat that pass, this domino effect will continue, I dont yet know if this is a problem yet
    for(int i = 0; i < grassList.size(); i++){
      
      int differenceBetweenXCoords = (grassList.get(i).getXCoord() - this.getXCoord());
      int differenceBetweenYCoords = (grassList.get(i).getYCoord() - this.getYCoord());
      
      if (Math.abs(differenceBetweenXCoords) <= 30 && Math.abs(differenceBetweenYCoords) <= 30){
        
        this.setXCoord(grassList.get(i).getXCoord());
        this.setYCoord(grassList.get(i).getYCoord());
        
        grassList.remove(i);
        
        this.healthPoints++;
        println("health points: " + this.healthPoints);
        
        
      }
      
      
    }
  
  }

}
