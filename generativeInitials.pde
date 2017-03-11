PFont pixelFont;
color baseColor = #492EFF;
int u = 40;
ArrayList<Character> initials = new ArrayList<Character>();
int[] chosenPixels = new int[8];
StringList memberNames = new StringList();

void setup(){
  size(640, 440, P2D); 
  pixelFont = loadFont("creativetech-320.vlw");
  background(baseColor);
  textFont(pixelFont, u*16);
  textAlign(LEFT, CENTER);
  
  JSONObject request = loadJSONObject("members.json");
  JSONArray members = request.getJSONArray("data");
  
  for (int n = 0; n < members.size(); n++){
    JSONObject member = members.getJSONObject(n); 
    String name = member.getString("name");
    memberNames.append(name);
  }
}

void mousePressed(){
  background(baseColor);      
  getInitials(int(random(0, memberNames.size())));
  
  fill(255);
  noStroke();
  rect(u, u, (u*16/2)-(u), u*11-(2*u));
  
  strokeWeight(u);
  stroke(255);
  noFill();
  rect((u*16/2)-u, u+(u/2), (u*16/2)-(u/2), u*11-(3*u));
  
  drawBorder(); 
  drawInitials(initials.get(0), initials.get(1));
  initials.clear();
  println(initials);
}

void getInitials(int m){
  String selectedMember = memberNames.get(m);
  println(selectedMember);
  
  String[] firstLast = split(selectedMember, " ");
  
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
      rect(0,0,u,u);
    } else if (chosenPixels[i] == 15){
      rect((u*16)-u,0,u,u);
    } else {
      rect(chosenPixels[i]*u,0,u,u);
      fill(baseColor);
      rect(chosenPixels[i]*u,u,u,u);
    }
    
    fill(255);
    
    if (chosenPixels[i] == 25){
      rect((u*16)-u, (u*11)-u, u, u);
    } else if (chosenPixels[i] == 40){
      rect(0, (u*11)-u, u, u);
    } else {
      rect((u*16)- u - ((chosenPixels[i+4] - 25) * u), (u*11) - u, u, u);
      fill(baseColor);
      rect(chosenPixels[i]*u,u,u, u);
    }
    
    fill(255);
    rect((u*16)-u, u + ((chosenPixels[i+2] - 16) * u), u, u);
    rect(0, (u*11)- u - ((chosenPixels[i+6] - 40) * u), u, u);
    
    fill(baseColor);
    rect((u*16)-(u*2), u + ((chosenPixels[i+2] - 16) * u), u, u); 
    rect(u, (u*11) - u - ((chosenPixels[i+6] - 40) * u), u, u);
  }
}

void drawInitials(char firstname, char lastname){
  fill(baseColor);
  text(firstname, u*3, (u*11)/2);
  fill(255);
  text(lastname, (u*16/2)+(u), (u*11)/2);
}