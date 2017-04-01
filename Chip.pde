class Chip {
  PVector location;
  int[] borderStyle = new int[8];
  int sequence;
  String name;
  
  Chip() {
    location = new PVector(0, 0);
    sequence++;
    getInitials(sequence); 
  }
  
  void createBorder(){
    for (int b = 0; b < 2; b++){
      borderStyle[b] = int(random(0,16));
      borderStyle[b+2] = int(random(16,25));
      borderStyle[b+4] = int(random(25,41));
      borderStyle[b+6] =  int(random(41,50));
    }
    println(borderStyle);
  }
  
  void getNew(){
    
  }
  
  void display(){
    drawSquaresBG();
    drawBorder(); 
    drawInitials(initials.get(0), initials.get(1));
    initials.clear();
    location.x = location.x + 60;
  }
}