PFont pixelFont;

color baseColor = #492EFF;
StringList memberNames = new StringList();
ArrayList<Character> initials = new ArrayList<Character>();
boolean fillToggle = true;
Chip c1;
Chip c2;

void setup(){
  size(1200, 900, P2D); 
  background(baseColor);
  
  pixelFont = createFont("creativetech.ttf", 32);
  textFont(pixelFont);
  textAlign(LEFT, BOTTOM);
  
  createNames(memberNames, initials);
  getInitials(int(random(memberNames.size())));
  c1 = new Chip(100, 100, initials, true);
  c2 = new Chip(140, 100, initials, false);
}

void draw(){
  c1.blinkDisplay(c1);
  c2.blinkDisplay(c2);
}