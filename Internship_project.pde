
Random rng = new Random();

Bunny[] bunnyList = new Bunny[10];
ArrayList<Grass> grassList = new ArrayList<>();

void setup() {
  frameRate(4);
  size(1440, 800);
  fillBunnyList(bunnyList);
  
}

void draw() {
  
  generateGrass();
  background(0,256,120);
  
  for(int i = 0; i < grassList.size(); i++){
  
    grassList.get(i).show();
    
  }
  
  for (Bunny bunny : bunnyList){
    
    bunny.randomWalk();
    bunny.show();
  
  }
  
  
}

void fillBunnyList(Bunny[] bunnyList){

  for(int i = 0; i < bunnyList.length; i++){
  
    bunnyList[i] = new Bunny();
    
  }
}

void generateGrass(){

  int xCoordOfGrass = rng.nextInt(1, 1439);
  int yCoordOfGrass = rng.nextInt(1, 799);
  
  
  
  grassList.add(new Grass(xCoordOfGrass, yCoordOfGrass));

}
