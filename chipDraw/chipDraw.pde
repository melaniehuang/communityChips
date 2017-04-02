PFont pixelFont;
color baseColor = #492EFF;
StringList memberNames = new StringList();
ArrayList<Character> initials = new ArrayList<Character>();
ArrayList<Chip> chipList = new ArrayList<Chip>();
PVector startingPoint = new PVector(20,20);
int gap = 10;

void setup(){
  size(1200, 900, P2D); 
  background(baseColor);
  pixelFont = createFont("creativetech.ttf", 32);
  textFont(pixelFont);
  textAlign(LEFT, BOTTOM);
  createNames(memberNames, initials);
  setupAllChips(startingPoint, gap);
}

void draw(){
  for (int c = 0; c < memberNames.size(); c++){
    Chip cd = chipList.get(c);
    cd.blinkDisplay(cd); 
  }
}