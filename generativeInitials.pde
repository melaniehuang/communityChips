PFont pixelFont;
int[] borderPixels = new int[50];

void setup(){
  size(32,22); 
  pixelFont = loadFont("creativetech-32.vlw");
  background(#0008FF);
  textFont(pixelFont, 32);
  textAlign(CENTER, CENTER);
}

void draw(){  
}

void mousePressed(){
  background(#0008FF);
  for (int p = 0; p < 50; p++){
    
    borderPixels[p] = int(random(2));
 
    fill(255);
    noStroke();
    
    if (p < 16 && borderPixels[p] == 1){
      rect(p * 2, 0, 2, 2);
    } else if ((p >= 16 && p < 25)&& borderPixels[p] == 1) { 
      rect(width - 2, 2 + ((p - 16) * 2), 2, 2);
    } else if ((p >= 25 && p < 41)&& borderPixels[p] == 1) {
      rect(width - 2 - ((p - 25) * 2), height - 2, 2, 2);
    } else if ((p >= 41)&& borderPixels[p] == 1) {
      rect(0, height - 2 - ((p - 40) * 2), 2, 2);
    }
  }
  println(borderPixels);
  
  fill(255);
  noStroke();
  rect(2,2,14,18);

  fill(#0008FF);
  text("A", width/2+4, height/2);
  fill(255);
  text("B", width/2+16, height/2);
}