ArrayList<BookSales> books = new ArrayList();
String title = "Booker Prize 2000-2011";
String subtitle = "Pre and Post Award Sales";
PFont f;
PFont t;
PFont it;
boolean bSelect = false;
int selectedBook = -1;


void setup(){
  size (1200, 800);
  background(72,139,142);
  smooth();

  f = createFont("ACaslonPro-Bold",36,true);
  t = createFont("DecoTypeNaskh", 14, true);
  it = createFont("ACaslonPro-Italic", 30, true);
  loadData();
  

}

void draw(){
  background(72,139,142);
  time();
  postaward();
  preaward();
  title();
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
    translate(b.pos.x-200, 710); // Translate to the center
    rotate(-HALF_PI);
//    rotate(-PI/4.0);
    textFont(t, 15);
    fill(255);
    text(b.growth+"%", 0, 200);
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
  float y = map(bos.growth, 88.67, 99.52, height-100, 300);
  float w = map(bos.preaward, 2397, 35900, 7, 100);
  float h = map(bos.preaward, 2397, 35900, 7, 100);
  bos.pos.x = x;
  bos.pos.y = y;
  
  fill(139, 142, 72);
  ellipse(x, y, w, h);
  line(x, y, x, 770);
  }
}

void postaward() {
  for(int i=0; i<12; i++) {

  BookSales bos = books.get(i);
  
  
  float x = map(bos.bookYear, 2000, 2011, 120, width-120);
  float y = map(bos.growth, 88.67, 99.52, height-100, 300);
  
  float w = map(bos.postaward, 182044, 1312221, 75, 547);
  float h = map(bos.postaward, 182044, 1312221, 75, 547);
  fill(142, 75, 72, 126);
  ellipse(x, y, w, h);
  }
}

void title(){
  textFont (f);
  fill(205, 229, 230);
  text(title, 790, 70);
  fill(177, 180, 107);
  textFont (f, 24);
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
  String growth = "Percentage Growth";
  stroke(142, 75, 72);
  line(993, 163, 1007, 163);
  fill(255);
  text(growth, 1020, 170);
  
}


void mouseMoved() {
  
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


// for(City c:cityList) {
//
//    fill(32);
//    pushMatrix();
//    translate(x+10,y); // Translate to the center
//    rotate(-PI/4.0);               // Rotate by theta
//    textAlign(LEFT) ;
//    text(c.name,0,0);
//    popMatrix();
//   
//    float barHeight = Float.valueOf(c.oil).floatValue() * 100 * 2;
//    fill(100);
//    rect(x, height-120-barHeight,50, barHeight);
//
//    fill(255);
//    textAlign(CENTER);
//    text(c.oil,x, height-120-30, 50, 20);
//    
//    x+=90; 
//  }  
