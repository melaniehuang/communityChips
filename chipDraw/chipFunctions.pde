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

boolean randomBool() {
  return random(1) > .5;
}

void setupAllChips(PVector v, int g){
  for (int i = 0; i < memberNames.size(); i++){
    getInitials(i); 
    boolean ia = randomBool();
    Chip cx = new Chip(v.x +(32+g)*i, v.y, initials, ia);
    chipList.add(cx);
    initials.clear();
  }
}