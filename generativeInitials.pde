PFont pixelFont;
int[] borderPixels = new int[50];
int[] chosenPixels = new int[8];

/*
Choose 1-2 numbers between 0 - 16
Choose 1-2 numbers between 16 - 24
Choose 1-2 numbers between 25 - 40
Choose 1-2 numbers between 41 - 49
*/


void setup(){
  size(320, 220, P2D); 
  pixelFont = loadFont("creativetech-320.vlw");
  background(#0008FF);
  textFont(pixelFont, 320);
  textAlign(LEFT, CENTER);
}

void draw(){ 
}


void mousePressed(){
  background(#0008FF);
  
  fill(255);
  noStroke();
  rect(20,20,140,180);

  strokeWeight(20);
  stroke(255);
  noFill();
  rect(width/2-10,30,140,160);
  
  int[] topRow = new int[2];
  int[] rightRow = new int[2];
  int[] bottomRow = new int[2];
  int[] leftRow = new int[2];
  
  for (int t = 0; t < 2; t++){
    topRow[t] = int(random(0,15));
    chosenPixels[t] = topRow[t];
  }
  for (int r = 0; r < 2; r++){
    rightRow[r] = int(random(16,24));
    chosenPixels[r+2] = rightRow[r];
  }
  for (int b = 0; b < 2; b++){
    bottomRow[b] = int(random(25,40));
    chosenPixels[b+4] = bottomRow[b];
  }
  for (int t = 0; t < 2; t++){
    leftRow[t] = int(random(41,50));
    chosenPixels[t+6] = leftRow[t];
  }
  
  println(chosenPixels);
  //chosenPixels[3,2,17,21,28,26,49,48]
  noStroke();
  
  for (int i = 0; i < 2; i++){
    fill(255);
    rect(chosenPixels[i]*20,0,20,20);
    rect(width - 20, 20 + ((chosenPixels[i+2] - 16) * 20), 20, 20);
    rect(width - 20 - ((chosenPixels[i+4] - 25) * 20), height - 20, 20, 20);
    rect(0, height - 20 - ((chosenPixels[i+6] - 40) * 20), 20, 20);
    fill(#0008FF);
    rect(chosenPixels[i]*20,20,20,20);
    rect(width - 40, 20 + ((chosenPixels[i+2] - 16) * 20), 20, 20);
    rect(width - 20 - ((chosenPixels[i+4] - 25) * 20), height - 40, 20, 20);
    rect(20, height - 20 - ((chosenPixels[i+6] - 40) * 20), 20, 20);
  }
  


  fill(#0008FF);
  text("M", 60, height/2);
  fill(255);
  text("H", width/2+20, height/2);
}

//void pixelGrid(){
//  for (int g = 0; g < 16; g++){ 
//    for (int h = 0; h < 11; h++){  
//      noFill();
//      stroke(255, 100);
//      rect(g*20,h*20,20,20);
//    }
//  }
//}