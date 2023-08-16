PlotWindow plotWindow;

Random rng = new Random();

int initialNumberOfBunnies = 20;
int initialNumberOfWolves = 10;

ArrayList<Bunny> bunnyList = new ArrayList<>();
ArrayList<Grass> grassList = new ArrayList<>();

void setup() {
  
  plotWindow = new PlotWindow();
  frameRate(10);
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
      
      //i is reset to -1 because if it were set to 0, the i++ in the if statement above would 
      //add 1 to 0 and the loop would begin checking i as 1 instead, this way it checks 0 first
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
class PlotWindow extends PApplet {
  
  int[] framesDisplayed = new int[40];
  int[] numberOfBunniesValuesDisplayed = new int[40];
  int[] numberOfWolvesValuesDisplayed = new int[40];
  
  int currentFrame = 1;

  public PlotWindow() {
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
    
    //ellipse(200,200,(bunnyList.size()*0.5),(grassList.size()*0.5));
    
    update();
    plot();
    
    
    
  }
  
  void plot(){
  
    //fill(0, 0, 255);
    //noStroke();
    
    for (int i = 0; i < 40; i++){
      
      circle(i*10,400 - numberOfBunniesValuesDisplayed[i],10);
      
    }
    
  
  }
  
  void update(){
    //the size of the lists are 40, however in order to avoid a index out of bounds exception
    //since I am reaching for i + 1 I set the max i value to 39
    for(int i = 0; i < 39; i++){
      //this shifts the graph to the "left", as the old values are shifted back 1 index to give space to 
      //the new value at index 40, giving the illusion that the graph is updating
      framesDisplayed[i] = framesDisplayed[i + 1];
      numberOfBunniesValuesDisplayed[i] = numberOfBunniesValuesDisplayed[i + 1];
      //numberOfWolvesValuesDisplayed[i] = numberOfWolvesValuesDisplayed[i + 1];
      
      framesDisplayed[39] = currentFrame;
      numberOfBunniesValuesDisplayed[39] = bunnyList.size();
      //numberOfWolvesValuesDisplayed[40] = wolfList.size();
    }
    
    currentFrame++;
    println(currentFrame);
  
  }
  
  

}
