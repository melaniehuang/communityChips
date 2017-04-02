class Chip {
  PVector location;
  PVector size = new PVector(32,22);
  ArrayList<Character> memberInitials;
  boolean blink;
  boolean chipBlinking;
  //int gridNmber
  int[] borderPixels = new int[8];

  Chip(float tempX, float tempY, ArrayList<Character> tempI, boolean tempB) {
    location = new PVector(random(tempX), random(tempY));
    memberInitials = new ArrayList<Character>();
    location.x = tempX;
    location.y = tempY;
    memberInitials.add(tempI.get(0));
    memberInitials.add(tempI.get(1));
    blink = tempB;
    if (tempB == true){
      chipBlinking = true;
    } else if (tempB == false){
      chipBlinking = false;
    }
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
    rect(location.x+2, location.y+2, size.x/2-2, size.y-4);
    
    strokeWeight(2);
    stroke(c);
    noFill();
    rect(location.x+14, location.y+3, size.x/2-1, size.y-6);
    
    drawBorder(c);
    
    fill(baseColor);   
    text(memberInitials.get(0), location.x+6, location.y+size.y-6);
    fill(c);
    text(memberInitials.get(1), location.x+18, location.y+size.y-6);
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

      if (borderPixels[i] == 0){
        rect(location.x, location.y, 2, 2);
      } else if (borderPixels[i] == 15){
        rect(location.x-2, location.y, 2, 2);
      } else {
        rect(location.x+((borderPixels[i])*2), location.y, 2, 2);
        fill(baseColor);
        rect(location.x+((borderPixels[i])*2), location.y+2, 2, 2);
      }
      
      fill(tempC);
      
      if (borderPixels[i] == 25){  
        rect(location.x+size.x-2, location.y+size.y-2, 2, 2);
      } else if (borderPixels[i] == 40){
        rect(location.x, location.y+size.y-2, 2, 2);
      } else {
        rect(location.x+(((borderPixels[i+4]-25))*2), location.y+(size.y-2), 2, 2);
        fill(baseColor);
        rect(location.x+(((borderPixels[i+4]-25))*2), location.y+(size.y-2)-2, 2, 2);
      }
        
      fill(tempC);
      rect(location.x+size.x-2, location.y+((borderPixels[i+2]-15)*2), 2, 2);
      rect(location.x, location.y+((borderPixels[i+6]-40)*2), 2, 2);
      
      fill(baseColor);
      rect(location.x+size.x-4, location.y+((borderPixels[i+2]-15)*2), 2, 2);
      rect(location.x+2, location.y+((borderPixels[i+6]-40)*2), 2, 2);
    }
  }
}