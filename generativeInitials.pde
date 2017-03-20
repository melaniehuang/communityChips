PFont pixelFont;
color baseColor = #492EFF;
int u = 2;
ArrayList<Character> initials = new ArrayList<Character>();
int[] chosenPixels = new int[8];
StringList memberNames = new StringList();

void setup(){
  size(1200, 900, P2D); 
  pixelFont = createFont("creativetech.ttf", u*16);
  background(baseColor);
  textFont(pixelFont);
  textAlign(LEFT, BOTTOM);
  
  JSONObject request = loadJSONObject("members.json");
  JSONArray members = request.getJSONArray("data");
  
  for (int n = 0; n < members.size(); n++){
    JSONObject member = members.getJSONObject(n); 
    String name = member.getString("name");
    memberNames.append(name);
  }
  println(request);
}

void mousePressed(){
  background(baseColor);
  for(int c = 0; c < memberNames.size(); c++){
    PVector startPoint = new PVector(random(width),random(height)); 
    pushMatrix();
    translate(startPoint.x, startPoint.y);
    getInitials(c);
    drawSquaresBG();
    drawBorder(); 
    drawInitials(initials.get(0), initials.get(1));
    popMatrix();
    initials.clear();
  }
}