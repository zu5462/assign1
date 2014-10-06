SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
  int totalScore=500;
// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
        totalScore-=50;      
      
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      //slot probability
      int sprobiblity=machine.probability(0.092); // 10%= 0.092+ 1/125 (probabilty of firfruit=secfruit=thrfruit=0 )
      int firfruit= int(random(6));
      int secfruit= int(random(6));
      int thrfruit= int(random(6));
     
      if(sprobiblity>0 || ( firfruit==secfruit && secfruit==thrfruit && thrfruit==0))
      {
      machine.setSlotFruit(0,0);
      machine.setSlotFruit(1,0);
      machine.setSlotFruit(2,0);
      }
      else 
      {
      //decide fruit
      machine.setSlotFruit(0,firfruit);
      machine.setSlotFruit(1,secfruit);
      machine.setSlotFruit(2,thrfruit);
      }
    
      //get score; seven=s,orange=o,cherry=c,etc..
      int sscore = machine.getSlotScore(0);
      int oscore = machine.getSlotScore(1); 
      int cscore = machine.getSlotScore(2);
      int lscore = machine.getSlotScore(3);
      int wscore = machine.getSlotScore(4);
      int bscore = machine.getSlotScore(5);
     
      //get fruit number^2 ;seven=s,orange=o,cherry=c,etc..
      float snumsq=sq(machine.getFruitCount(0));
      float onumsq=sq(machine.getFruitCount(1));
      float cnumsq=sq(machine.getFruitCount(2));
      float lnumsq=sq(machine.getFruitCount(3));
      float wnumsq=sq(machine.getFruitCount(4));
      float bnumsq=sq(machine.getFruitCount(5));
      
      //get socre
       totalScore+=int(snumsq*sscore+onumsq*oscore+cnumsq*cscore+lnumsq*lscore+wnumsq*wscore+bnumsq*bscore);
 
      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}







