
class Bunny extends Animal{

  Bunny(){
    super();
    this.healthPoints = 150;
    this.hungerPoints = 100;
    
    //setXCoord((int)random(1,1439));
    setXCoord((int)random(1,1439));
    setYCoord((int)random(1,799));
  
  }
  
  Bunny(int xCoord, int yCoord){
    super(xCoord, yCoord);
    this.healthPoints = 150;
    this.hungerPoints = 100;
  
  }
  
  void show(){  
    
    fill(127, 0, 255);
    
    noStroke();
    ellipse(getXCoord(),getYCoord(),3,3);
    
  }
  
  void checkForGrass(ArrayList<Grass> grassList){
    /*Future issue --> this allows for a bunny to eat grass in chain reaction fashion, if it moves to one piece of grass it 
    has now changed its coordinates, so that the next time it checks for grass if it has moved closer to another piece
    it can then eat that pass, this domino effect will continue, I dont yet know if this will be a problem, but so far
    it is not*/
    for(int i = 0; i < grassList.size(); i++){
      
      int differenceBetweenXCoords = (grassList.get(i).getXCoord() - this.getXCoord());
      int differenceBetweenYCoords = (grassList.get(i).getYCoord() - this.getYCoord());
      
      if (Math.abs(differenceBetweenXCoords) <= 50 && Math.abs(differenceBetweenYCoords) <= 50){
        
        this.setXCoord(grassList.get(i).getXCoord());
        this.setYCoord(grassList.get(i).getYCoord());
        
        grassList.remove(i);
        
        this.hungerPoints = this.hungerPoints + 30;
        

        break;
        
      }
      
      
    }
  
  }
  
  boolean checkIfDead(ArrayList<Bunny> bunnyList, int index){
  
    boolean isDead = false;
    
    if (bunnyList.get(index).healthPoints <= 0 || bunnyList.get(index).hungerPoints <= 0){

      //println("dead health: " + bunnyList.get(index).healthPoints);
      //println("dead hunger: " + bunnyList.get(index).hungerPoints);
      //bunnyList.remove(index);
      isDead = true;
      
    }
  
    return isDead;
  }
  
  void checkIfCanReproduce(ArrayList<Bunny> bunnyList){
  
    boolean canReproduce = false;
    
    if(this.isFemale == true){
      
      for(int i = 0; i < bunnyList.size(); i++){
        
        int differenceBetweenXCoords = (bunnyList.get(i).getXCoord() - this.getXCoord());
        //println("difference x" + differenceBetweenXCoords);
        int differenceBetweenYCoords = (bunnyList.get(i).getYCoord() - this.getYCoord());
        //println("difference y" + differenceBetweenYCoords);
        
        //println(bunnyList.get(i).equals(this));
        
        //bunnyList.get(i) != this
        
        if( !bunnyList.get(i).equals(this)
          && this.birthAbilityPoints >= 5
          && bunnyList.get(i).birthAbilityPoints >= 5
          && this.maturityPoints >= 34
          && bunnyList.get(i).maturityPoints >= 34
          && Math.abs(differenceBetweenXCoords) <= 60 
          && Math.abs(differenceBetweenYCoords) <= 60 
          && bunnyList.get(i).isMale == true){
            
          //println("mating");
          canReproduce = true;
          //for now the bunny will give birth to 3 offspring, when genes are introduced this number will vary
          
        
        }
        
        
      }
      
      if (canReproduce == true){
        
        this.birthAbilityPoints = 0;
        
        for(int j = 0; j < 20; j++){
            
            bunnyList.add(new Bunny(this.getXCoord(),this.getYCoord()));
            //println("born " + bunnyList.size());
        
        }
      
      }
      
    
    
    }
      
  
  }

}
