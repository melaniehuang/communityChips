PFont pixelFont;
int[] borderPixels = new int[50];

void setup(){
  size(32,22); 
  pixelFont = loadFont("creativetech-32.vlw");
  background(#0008FF);
  textFont(pixelFont, 32);
  textAlign(CENTER, CENTER);
  
  //draw top
  for (int p = 0; p < 50; p++){
    borderPixels[p] = int(random(2));
    if (borderPixels[p] == 1){
      fill(255);
      noStroke();
      rect(p*2,0,2,2);
    }
  }  
}

void draw(){  
  fill(255);
  noStroke();
  rect(2,2,14,18);

  fill(#0008FF);
  text("A", width/2+4, height/2);
  fill(255);
  text("B", width/2+16, height/2);
}