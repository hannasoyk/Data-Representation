ArrayList<BookSales> books = new ArrayList();
String title = "Booker Prize 2000-2011";
String subtitle = "Pre and Post Award Sales";
PFont f;
PFont t;
PFont it;
boolean bSelect = false;
int selectedBook = -1;


void setup(){
  size (1200, 860);
  background(72,139,142);
  smooth();

  f = createFont("ACaslonPro-Bold",36,true);
  t = createFont("DecoTypeNaskh", 14, true);
  it = createFont("ACaslonPro-Italic", 30, true);
  loadData();
  

}

void draw(){
  mouseDetect();
  background(72,139,142);
  time();
  postaward();
  preaward();
  maintitle();
  legend();
  
  
  
  if(bSelect) {
    textFont(t);
    BookSales b = books.get(selectedBook);
    
    pushMatrix();
    translate(b.pos.x, b.pos.y-50); // Translate to the center
    textAlign(CENTER);
    fill(205, 229, 230);
    text(b.author, 0, 20);
    textFont(it, 22);
    fill(172, 211, 213);
    text(b.title, 0, 0);
    
    popMatrix();
    
    pushMatrix();
    translate(b.pos.x, b.pos.y+50); // Translate to the center
    //rotate(-HALF_PI);
    textFont(t, 15);
    fill(205, 229, 230);
    text(b.growth+"X", 0, 0);
    popMatrix();
        
    /*
    switch(selectedBook) {
      case 0: {}break;  // first book selected
      case 1: break;
      case 2: break;
      case 3: break;
      case 4: break;
      case 5: break;
      case 6: break;     
      case 7: break;  
      case 8: break;     
      case 9: break;  
      case 10: break;     
      case 11: break;      
    }
    
  */

  }  
        textAlign(LEFT);

}
  

void loadData() {
  String[] rows = loadStrings("bookerballoons.csv");
  //Go through each of the rows and split into columns
  for(int i=1; i<13; i++) {
    BookSales bos = new BookSales();
    bos.fromCSV(rows[i].split(","));
    books.add(bos);
  }
}

void time() {
  for(int i=0; i<books.size(); i++) {
  BookSales bos = books.get(i);
  textFont (t);
  fill(255);
  textSize (16);
  stroke(142, 75, 72);
  float x = map(bos.bookYear, 2000, 2011, 120, width-120);
  float y = 100;
  text(bos.bookYear, x, height-30);
  }
}

void preaward() {
  for(int i=0; i<12; i++) {
  BookSales bos = books.get(i);
  float x = map(bos.bookYear, 2000, 2011, 120, width-120);
  //float y = map(bos.growth, 782, 20772, height-200, 200);
  float y = map(bos.growth, 8, 208, height-200, 200);
  float w = map(sqrt(bos.preaward), sqrt(2397), sqrt(35900), 7, 100);
  bos.pos.x = x;
  bos.pos.y = y;
  
  fill(139, 142, 72);
  ellipse(x, y, w, w);
  line(x, y, x, 830);
  }
}

void postaward() {
  for(int i=0; i<12; i++) {

  BookSales bos = books.get(i);
  
  
  float x = map(bos.bookYear, 2000, 2011, 120, width-120);
  //float y = map(bos.growth, 782, 20772, height-200, 200);  
  float y = map(bos.growth, 8, 208, height-200, 200);
  float w = map(sqrt(bos.postaward), sqrt(182044), sqrt(1312221), 75, 547);
  fill(142, 75, 72, 126);
  ellipse(x, y, w, w);
  }
}

void maintitle(){
  textFont (f);
  fill(205, 229, 230);
   
  text(title, 790, 70);
  
  fill(177, 180, 107);
 
  textFont (it, 24);
  text(subtitle, 890, 102);
 
}

void legend(){
  
  //post award sales
  fill(142, 75, 72, 126);
  stroke(142, 75, 72, 126);
  ellipse(1000, 143, 12, 12);
  String postaward = "Post Award Sales";
  textFont(t);
  fill(255);
  text(postaward, 1020, 150);
  
  // yellow dot for pre award sales
  fill(139, 142, 72);
  stroke(139, 142, 72);
  ellipse(1000, 123, 10, 10);
  String preaward = "Pre Award Sales";

  fill(255);
  textFont(t);
  text(preaward, 1020, 130);
  
  //line for percentage growth
  String growth = "Growth Increase";
  stroke(142, 75, 72);
  line(993, 163, 1007, 163);
  fill(255);
  text(growth, 1020, 170);
  
}


void mouseDetect() {
  
    for(BookSales b:books) {
    if((mouseX >= b.pos.x-20 && mouseX <= b.pos.x+20) && (mouseY >= b.pos.y-20 && mouseY <= b.pos.y+20)) {
      if(bSelect) return;
      bSelect = true;      
      selectedBook = books.indexOf(b);
      return;
    }
    else {
      bSelect = false;
      selectedBook = -1;
    } 
  }
}



class BookSales {
  int bookYear;
  String title;
  String author;
  int preaward;
  int postaward;
  int growth;
  PVector pos = new PVector();
  
  
  void fromCSV(String[] input) {
    bookYear = int(input[0]);
    author = input[1];
    title = input[2];
    preaward = int(input[3]);
    postaward = int(input[4]);
    growth = int(input[5]);
  }
}

