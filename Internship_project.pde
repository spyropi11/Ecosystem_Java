
Bunny[] bunnyList = new Bunny[10];
ArrayList<Grass> grassList = new ArrayList<>();

void setup() {
  frameRate(4);
  size(1440, 800);
  fillBunnyList(bunnyList);
  
}

void draw() {
  
  background(0,256,120);
  
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

void generateGrass(ArrayList<Grass> grassList){

  

}
