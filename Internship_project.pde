
Random rng = new Random();

Data dataWriter = new Data();

int currentFrame = 1;

int initialNumberOfBunnies = 150;
int initialNumberOfWolves = 100;

ArrayList<Wolf> wolfList = new ArrayList<>();
ArrayList<Bunny> bunnyList = new ArrayList<>();
ArrayList<Grass> grassList = new ArrayList<>();

void setup() {
  
  dataWriter.clearTextFile();
  frameRate(70);
  size(1440, 800);
  fillWolfList(wolfList);
  fillBunnyList(bunnyList);
  
  for (int i = 0; i < 100; i++){
  
    grassList.add(new Grass(rng.nextInt(1, 1439), rng.nextInt(1,799)));
  
  }
  
  
  
}

void draw() {
  
  background(0,256,120);
  
  for (int i = 0; i < 5; i++){
    generateGrass();
    
  }

  showGrass(grassList);
  
  updateWolfStatus();
  updateBunnyStatus();

  showWolves(wolfList);
  showBunnies(bunnyList);
  //showWolves(wolvesList);
  
  
  
  dataWriter.write(currentFrame, bunnyList.size(), wolfList.size());
  
  currentFrame++;
  //println("frame: " + currentFrame);
  //println("-------------------------");
  
  
}

void fillBunnyList(ArrayList<Bunny> bunnyList){

  for(int i = 0; i < initialNumberOfBunnies; i++){
  
    bunnyList.add(new Bunny());
    
    
  }
  
  //println(bunnyList.size());
}

void fillWolfList(ArrayList<Wolf> wolfList){

  for(int i = 0; i < initialNumberOfWolves; i++){
    
      wolfList.add(new Wolf());
    
  }

}

void showBunnies(ArrayList<Bunny> bunnyList){

  for (int i = 0; i < bunnyList.size(); i++){
  
    bunnyList.get(i).show();
  
  }

}

void showWolves(ArrayList<Wolf> wolfList){

  for (int i = 0; i < wolfList.size(); i++){
  
    wolfList.get(i).show();
  
  }

}

void showGrass(ArrayList<Grass> grassList){

  for(int i = 0; i < grassList.size(); i++){
  
    grassList.get(i).show();
    
  }
  

}

void updateBunnyStatus(){
  
  for (int i = 0; i < bunnyList.size(); i++){
    
    bunnyList.get(i).randomWalk();
    
    bunnyList.get(i).checkIfCanReproduce(bunnyList);
    bunnyList.get(i).checkForGrass(grassList);
    bunnyList.get(i).updatePoints();
  
  }
  
  for (int j = 0; j < bunnyList.size(); j++){
        
    if (bunnyList.get(j).checkIfDead(bunnyList,j)){
        //println("x:" + bunnyList.get(i).getXCoord() + " " + bunnyList.get(i).getXCoord());
        
        //i is reset to -1 because if it were set to 0, the i++ in the if statement above would 
        //add 1 to 0 and the loop would begin checking i as 1 instead, this way it checks 0 first
        bunnyList.remove(j);
        
        j = -1;
        
    }
        
      
        
  }
  
}

void updateWolfStatus(){
  
  for (int i = 0; i < wolfList.size(); i++){
    
    wolfList.get(i).randomWalk();
    
    wolfList.get(i).checkIfCanReproduce(wolfList);
    wolfList.get(i).checkForBunnies(bunnyList);
    wolfList.get(i).updatePoints();

  
  }
  
  for (int j = 0; j < wolfList.size(); j++){
        
    if (wolfList.get(j).checkIfDead(wolfList,j)){
        //println("x:" + bunnyList.get(i).getXCoord() + " " + bunnyList.get(i).getXCoord());
        
        //i is reset to -1 because if it were set to 0, the i++ in the if statement above would 
        //add 1 to 0 and the loop would begin checking i as 1 instead, this way it checks 0 first
        //wolfList.remove(j);
        
        j = -1;
        
    }
        
      
        
  }

}

void generateGrass(){

  //There is an exponential growth issue here!
  boolean grassCanSpawn = false;
  
  int randomSpawnChance = rng.nextInt(1,10);
  
  
  //This will make it so that each frame there is a 50% chance of grass spawning
  if(randomSpawnChance <= 10){
    
    
    while (grassCanSpawn == false){
      
      //Until the if statement below proves that grass cannot spawn, this is set to true
      grassCanSpawn = true;
      int xCoordOfGrass = rng.nextInt(1, 1439);
      int yCoordOfGrass = rng.nextInt(1, 799);
      for(int i = 0; i < grassList.size(); i++){
        
          //makes sure grass does not spawn on another piece of grass
          if(xCoordOfGrass == grassList.get(i).getXCoord() && yCoordOfGrass == grassList.get(i).getYCoord()){
            
            grassCanSpawn = false;
            
          }
      }
        
      if (grassCanSpawn == true){
      
        grassList.add(new Grass(xCoordOfGrass, yCoordOfGrass));
      
      }
      
    }
  }  

}
