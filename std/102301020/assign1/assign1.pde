//hi~
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

int dice;

int fid;
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
     totalScore -= 50;

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
      int dice = int(random(6));
      switch (dice){
  
case 1: //dice == 1
machine.setSlotFruit(0 , 0);
break;
case 2: //dice == 2
machine.setSlotFruit(0 , 1);
break;
case 3: //dice == 3
machine.setSlotFruit(0 , 2);
break;
case 4: //dice == 4
machine.setSlotFruit(0 , 3);
break;
case 5: //dice == 5
machine.setSlotFruit(0 , 4);
break;
case 6: //dice ==6
machine.setSlotFruit(0 , 5);
break;}

      int dice2 = int(random(6));
      switch (dice2){
        
case 1: //dice == 1
machine.setSlotFruit(1 , 0);
break;
case 2: //dice == 2
machine.setSlotFruit(1 , 1);
break;
case 3: //dice == 3
machine.setSlotFruit(1 , 2);
break;
case 4: //dice == 4
machine.setSlotFruit(1 , 3);
break;
case 5: //dice == 5
machine.setSlotFruit(1 , 4);
break;
case 6: //dice ==6
machine.setSlotFruit(1 , 5);
break;}


      int dice3 = int(random(6));
      switch (dice3){
 
case 1: //dice == 1
machine.setSlotFruit(2 , 0);
break;
case 2: //dice == 2
machine.setSlotFruit(2 , 1);
break;
case 3: //dice == 3
machine.setSlotFruit(2 , 2);
break;
case 4: //dice == 4
machine.setSlotFruit(2 , 3);
break;
case 5: //dice == 5
machine.setSlotFruit(2 , 4);
break;
case 6: //dice ==6
machine.setSlotFruit(2 , 5);
break;
}
         
         
        
int a = machine.getSlotScore(0);
int b = machine.getSlotScore(1);
int c = machine.getSlotScore(2);
int d = machine.getSlotScore(3);
int e = machine.getSlotScore(4);
int f = machine.getSlotScore(5);

int g = machine.getFruitCount(0);
int h = machine.getFruitCount(1);
int i = machine.getFruitCount(2);
int j = machine.getFruitCount(3);
int k = machine.getFruitCount(4);
int l = machine.getFruitCount(5);
      
      totalScore += a*sq(g) + b*sq(h) + c*sq(i) + d*sq(j) + e*sq(k)+ f*sq(l);
      
      
      
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







