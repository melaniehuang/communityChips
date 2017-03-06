PFont pixelFont;
int[] chosenPixels = new int[8];

color baseColor = #FF3939;
String name = "Bon Jon Io Quant";
ArrayList<Character> initials = new ArrayList<Character>();

void setup(){
  size(320, 220, P2D); 
  pixelFont = loadFont("creativetech-320.vlw");
  background(baseColor);
  textFont(pixelFont, 320);
  textAlign(LEFT, CENTER);
}

void mousePressed(){
  
  String[] firstLast = split(name, " ");
    
  if (firstLast.length == 1){
    String firstname = firstLast[0];
    
    initials.add(firstname.charAt(0));
    initials.add(' ');
  } else {
    String firstname = firstLast[0];
    String lastname = firstLast[firstLast.length-1];

    initials.add(firstname.charAt(0));
    initials.add(lastname.charAt(0));
  }
  
  background(baseColor);
  fill(255);
  noStroke();
  rect(20,20,140,180);
  
  strokeWeight(20);
  stroke(255);
  noFill();
  rect(width/2-10,30,140,160);
  
  drawBorder(); 
  drawInitials(initials.get(0), initials.get(1));
}

void drawBorder(){
  noStroke();
  
  for (int p = 0; p < 2; p++){
    chosenPixels[p] = int(random(0,16));
    chosenPixels[p+2] = int(random(16,25));
    chosenPixels[p+4] = int(random(25,41));
    chosenPixels[p+6] =  int(random(41,50));
  }
  
  for (int i = 0; i < 2; i++){
    fill(255);
    
    if (chosenPixels[i] == 0){
      rect(0,0,20,20);
    } else if (chosenPixels[i] == 15){
      rect(width-20,0,20,20);
    } else {
      fill(255);
      rect(chosenPixels[i]*20,0,20,20);
      fill(baseColor);
      rect(chosenPixels[i]*20,20,20,20);
    }
    
    if (chosenPixels[i] == 25){
      fill(255);
      rect(width-20, height-20, 20, 20);
    } else if (chosenPixels[i] == 40){
      fill(255);
      rect(0, height-20, 20, 20);
    } else {
      fill(255);
      rect(width - 20 - ((chosenPixels[i+4] - 25) * 20), height - 20, 20, 20);
      fill(baseColor);
      rect(width - 20 - ((chosenPixels[i+4] - 25) * 20), height - 40, 20, 20);
    }
    
    fill(255);
    rect(width - 20, 20 + ((chosenPixels[i+2] - 16) * 20), 20, 20);
    rect(0, height - 20 - ((chosenPixels[i+6] - 40) * 20), 20, 20);
    fill(baseColor);
    rect(width - 40, 20 + ((chosenPixels[i+2] - 16) * 20), 20, 20); 
    rect(20, height - 20 - ((chosenPixels[i+6] - 40) * 20), 20, 20);
  }
}

void drawInitials(char firstname, char lastname){
  fill(baseColor);
  text(firstname, 60, height/2);
  fill(255);
  text(lastname, width/2+20, height/2);
}