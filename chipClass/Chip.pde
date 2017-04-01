class Chip {
  PVector location;
  PVector size = new PVector(32,22);
  ArrayList<Character> memberInitials;
  boolean blink;
  boolean chipBlinking;

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
  }

  void display(color c) {
    fill(c);
    noStroke();
    rect(location.x+2, location.y+2, (size.x-4)/2, size.y-4);
    
    strokeWeight(2);
    stroke(c);
    noFill();
    rect(location.x+14, location.y+3, (size.x-4)/2+2 , size.y-6);
    
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
}

void createNames(StringList m, ArrayList<Character> i){
  JSONObject request = loadJSONObject("members.json");
  JSONArray members = request.getJSONArray("data");
  
  for (int n = 0; n < members.size(); n++){
    JSONObject member = members.getJSONObject(n); 
    String name = member.getString("name");
    m.append(name);
  }
}

void getInitials(int nextMember){
  String selectedMember = memberNames.get(nextMember);
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