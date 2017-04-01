class Chip {
  PVector location;
  PVector size = new PVector(32,22);
  ArrayList<Character> memberInitials;
  boolean blink;
  boolean chipBlinking;
  //int gridNumber
  int[] borderPixels = new int[8];

  Chip(float tempX, float tempY, ArrayList<Character> tempI, boolean tempB) {
    location = new PVector(random(tempX), random(tempY));
    memberInitials = new ArrayList<Character>();
    location.x = tempX;
    location.y = tempY;
    memberInitials = tempI;
    blink = tempB;
    if (tempB == true){
      chipBlinking = true;
    } else if (tempB == false){
      chipBlinking = false;
    }
    println(memberInitials);
    
    for (int p = 0; p < 2; p++){
      borderPixels[p] = int(random(0,16));
      borderPixels[p+2] = int(random(16,25));
      borderPixels[p+4] = int(random(25,41));
      borderPixels[p+6] =  int(random(41,50));
    }
  }

  void display(color c) {
    fill(c);
    noStroke();
    rect(location.x+2, location.y+2, (size.x-4)/2, size.y-4);
    
    strokeWeight(2);
    stroke(c);
    noFill();
    rect(location.x+14, location.y+3, (size.x-4)/2+2 , size.y-6);
    
    drawBorder(c);
    
    fill(baseColor);
    text("A", location.x+6, location.y+size.y-6);
    fill(c);
    text("B", location.x+18, location.y+size.y-6);
  }
  
  void blinkDisplay(Chip tempC){
    if (tempC.blink == true){ 
      if (frameCount%50 == 0 && chipBlinking == true){
        chipBlinking = false;
        display(baseColor);
      } else if (frameCount%50 == 0 && chipBlinking == false){
        chipBlinking = true;
        display(255);
      }
    } else if (tempC.blink == false){
        display(255);
    }
  }
  
  void drawBorder(color tempC){
    noStroke();
    for (int i = 0; i < 2; i++){
      fill(tempC);
      rect(location.x+((borderPixels[i]-1)*2), location.y, 2, 2);
      rect(location.x+(((borderPixels[i+4]-25)-1)*2), location.y+(size.y-2), 2, 2);
      
      fill(baseColor);
      rect(location.x+((borderPixels[i]-1)*2), location.y+2, 2, 2);
      rect(location.x+(((borderPixels[i+4]-25)-1)*2), location.y+(size.y-2)-2, 2, 2);
    }
  }
}