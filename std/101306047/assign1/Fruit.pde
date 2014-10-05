class Fruit{
  int fruitId;
  int score;
  String imgPath;
  PImage img;
  
  Fruit(int fid, int score){
    this.fruitId = fid;
    this.score = score;
    this.imgPath = "data/0"+fruitId+".png";
    this.img = loadImage(imgPath); 
  }
/*  
Fruit(0,60);
Fruit(1,10);
Fruit(2,20);
Fruit(3,30);
Fruit(4,40);
Fruit(5,50);
*/
  void display(int x, int y, int w, int h){
    image(this.img, x, y, w, h);
  }
  
}
