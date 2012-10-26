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
