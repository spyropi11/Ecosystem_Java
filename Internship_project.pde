
Bunny[] bunnyList = new Bunny[10];

void setup() {
  size(1440, 800);
  fillBunnyList(bunnyList);
  
}

void draw() {
  
  background(0,256,120);
  for(int i = 0; i < bunnyList.length; i++){
  
    bunnyList[i].randomWalk();
    bunnyList[i].show();
    
  }
  
  
}

void fillBunnyList(Bunny[] bunnyList){

  for(int i = 0; i < bunnyList.length; i++){
  
    bunnyList[i] = new Bunny();
    
  }
}
