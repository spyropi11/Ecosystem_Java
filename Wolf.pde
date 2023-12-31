
class Wolf extends Animal{

  Wolf(){
  
    super();
    this.healthPoints = 150;
    this.hungerPoints = 100;
    
    //setXCoord((int)random(1,1439));
    setXCoord((int)random(720,1439));
    setYCoord((int)random(1,799));
  
  }
  
  Wolf(int xCoord, int yCoord){
  
    super(xCoord, yCoord);
    this.healthPoints = 150;
    this.hungerPoints = 100;

  
  }
  
  void show(){  
    
    fill(0, 0, 0);
    
    noStroke();
    ellipse(getXCoord(),getYCoord(),4,4);
    
  }
  
  boolean checkIfDead(ArrayList<Wolf> wolfList, int index){
  
    boolean isDead = false;
    
    if (wolfList.get(index).healthPoints <= 0 || wolfList.get(index).hungerPoints <= 0){

      wolfList.remove(index);
      isDead = true;
      
    }
  
    return isDead;
  }
  
  void checkIfCanReproduce(ArrayList<Wolf> wolfList){
  
    boolean canReproduce = false;
    
    if(this.isFemale == true){
      
      for(int i = 0; i < wolfList.size(); i++){
        
        int differenceBetweenXCoords = (wolfList.get(i).getXCoord() - this.getXCoord());
        //println("difference x" + differenceBetweenXCoords);
        int differenceBetweenYCoords = (wolfList.get(i).getYCoord() - this.getYCoord());
        //println("difference y" + differenceBetweenYCoords);
        
        //println(bunnyList.get(i).equals(this));
        
        //bunnyList.get(i) != this
        
        if( !wolfList.get(i).equals(this)
          && this.birthAbilityPoints >= 5
          && wolfList.get(i).birthAbilityPoints >= 5
          && this.maturityPoints >= 34
          && wolfList.get(i).maturityPoints >= 34
          && Math.abs(differenceBetweenXCoords) <= 60 
          && Math.abs(differenceBetweenYCoords) <= 60 
          && wolfList.get(i).isMale == true){
            
          canReproduce = true;
          //for now the wolf will give birth to 2 offspring, when genes are introduced this number will vary
          
        
        }
        
        
      }
      
      if (canReproduce == true){
        
        this.birthAbilityPoints = 0;
        
        for(int j = 0; j < 2; j++){
            
            wolfList.add(new Wolf(this.getXCoord(),this.getYCoord()));
            //println("born " + bunnyList.size());
        
        }
      
      }
      
    
    
    }
      
  
  }
  
  void checkForBunnies(ArrayList<Bunny> bunnyList){

    for(int i = 0; i < bunnyList.size(); i++){
      
      int differenceBetweenXCoords = (bunnyList.get(i).getXCoord() - this.getXCoord());
      int differenceBetweenYCoords = (bunnyList.get(i).getYCoord() - this.getYCoord());
      
      if (Math.abs(differenceBetweenXCoords) <= 20 && Math.abs(differenceBetweenYCoords) <= 20){
        
        this.setXCoord(bunnyList.get(i).getXCoord());
        this.setYCoord(bunnyList.get(i).getYCoord());
        
        bunnyList.remove(i);
        
        this.hungerPoints = this.hungerPoints + 30;
        
        break;
        
        
        
      }
      
      
    }
  
  }
  

}
