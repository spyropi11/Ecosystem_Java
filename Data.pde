import java.io.FileWriter;   // Import the FileWriter class
import java.io.PrintWriter;
import java.io.IOException;

class Data {
  
  PrintWriter pr;
  
  Data(){
  
    
  }
  
  void write(int currentFrame, int amountOfBunnies){
    
    try {
      
      FileWriter fw = new FileWriter("/Users/Spyros/Documents/Processing/Internship_project/simData.txt", true);
      pr = new PrintWriter(fw);
      pr.println(currentFrame + " " + amountOfBunnies);
      
      pr.close();
      
    }catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
    
  
  }
  
  void clearTextFile(){
  
    try{
      FileWriter fw = new FileWriter("/Users/Spyros/Documents/Processing/Internship_project/simData.txt", false);
      fw.write("");
      fw.close();
    }catch(IOException e){
    
    
    }
  
  }
  
}
