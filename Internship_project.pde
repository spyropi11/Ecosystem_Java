ChildApplet child;

Random rng = new Random();

int initialNumberOfBunnies = 20;
int initialNumberOfWolves = 10;

ArrayList<Bunny> bunnyList = new ArrayList<>();
ArrayList<Grass> grassList = new ArrayList<>();

void setup() {
  
  child = new ChildApplet();
  frameRate(1);
  size(1440, 800);
  fillBunnyList(bunnyList);
  grassList.add(new Grass(rng.nextInt(1, 1439), rng.nextInt(1,799)));
  
}

void draw() {
  
  generateGrass();
  
  background(0,256,120);
  
  for(int i = 0; i < grassList.size(); i++){
  
    grassList.get(i).show();
    
  }
  
  for (int i = 0; i < bunnyList.size(); i++){
    
    bunnyList.get(i).randomWalk();
    bunnyList.get(i).checkForGrass(grassList, bunnyList);
    bunnyList.get(i).show();
    bunnyList.get(i).updateHealthLeft();
    //println("i is: " + i);
    if (bunnyList.get(i).checkIfDead(bunnyList,i)){
      i = -1;
       println("dead");
    }
    //println("list size: " + bunnyList.size());
  
  }
  
  //println("-------------------------");
  
  
}

void fillBunnyList(ArrayList<Bunny> bunnyList){

  for(int i = 0; i < initialNumberOfBunnies; i++){
  
    bunnyList.add(new Bunny());
    
    
  }
  
  println(bunnyList.size());
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

//This class is not in it's own file, so that it can have direct access to all of the 
//parameters that the main window has
class ChildApplet extends PApplet {

    //JFrame frame;

  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(400, 400);
    smooth();
  }
  public void setup() { 
    windowTitle("Graph Window");
    
  }

  public void draw() {
    background(150);
    
    //the value for the radius will be equal to the size of the litst of bunnies multiplied by some decimal 
    //to represent the growth at the moment
    
    circle(200,200,(10*0.1));
    
  }

}
