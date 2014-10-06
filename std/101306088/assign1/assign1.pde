SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
//boolean equal= false;

int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables


int score0;
int score1;
int score2;
int f0;
int f1;
int f2;
int fid0;
int fid1;
int fid2;
int totalScore = 500;


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
      // start 
       totalScore= totalScore-50;
       
    
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop 
       int fid0=int(random(6));
       int fid1=int(random(6));
       int fid2=int(random(6));
      
       
      // machine.probability(0.1)
      // fid0=fid1=fid2=int(random(1));
       
       int t1;
       int t2;
       int t0;
 
      

      
      machine.setSlotFruit( 0,  fid0);
      machine.setSlotFruit( 1, fid1);
      machine.setSlotFruit( 2, fid2);
      
      t0=machine.getFruitCount(fid0);
      t1=machine.getFruitCount(fid1);
      t2=machine.getFruitCount(fid2);

      score0=machine.getSlotScore( fid0);
      score1=machine.getSlotScore( fid1);
      score2=machine.getSlotScore( fid2);
      

 totalScore= totalScore+t0*score0+t1*score1+t2*score2 ;


     
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







