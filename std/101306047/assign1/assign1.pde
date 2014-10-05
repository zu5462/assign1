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
// put your code inside here
int totalScore = 500;

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
      // put your code inside here
      totalScore=totalScore-50;
     
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
      // put your code inside here
      
      machine.setSlotFruit(0,int(random(6)));
      machine.setSlotFruit(1,int(random(6)));
      machine.setSlotFruit(2,int(random(6)));
     
     //--------------------------------------------------- 
     if (machine.probability(0.1)==0){
     
      println("WTF= =");
     }else{
     println("FINE");
     }
      /*not probability = =
      int r1=int(random(6));
      int r2=int(random(6));
      int r3=int(random(6));
      if(count<10){
      machine.setSlotFruit(0,r1);
      machine.setSlotFruit(1,r2);
      machine.setSlotFruit(2,r3); 
      }
    else{
      machine.setSlotFruit(0,0);
      machine.setSlotFruit(1,0);
      machine.setSlotFruit(2,0); 
    count=0;
    }*/
     
    // float pp=pow(10,0.33);
     /* if (r1=0 && r2=0 && r3=0){
      machine.setSlotFruit(0,3);
      machine.setSlotFruit(1,3);
      machine.setSlotFruit(2,3);
      }
      else{
      machine.setSlotFruit(0,r1);
      machine.setSlotFruit(1,r2);
      machine.setSlotFruit(2,r3);
      }*/
      
      
    //---------------------------------------  
      int a=machine.getSlotScore(0);//60
      int b=machine.getSlotScore(1);//10
      int c=machine.getSlotScore(2);//20
      int d=machine.getSlotScore(3);
      int e=machine.getSlotScore(4);
      int f=machine.getSlotScore(5);
        
      int m=machine.getFruitCount(0);//3
      int n=machine.getFruitCount(1);
      int o=machine.getFruitCount(2);
      int p=machine.getFruitCount(3);
      int q=machine.getFruitCount(4);
      int r=machine.getFruitCount(5);
      totalScore=totalScore+m*a+n*b+o*c+p*d+q*e+r*f;
 
 
 
      
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







