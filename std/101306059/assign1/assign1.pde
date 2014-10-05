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
      totalScore = totalScore-50;
     

      
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
      int firstPlace;
      int secondPlace;
      int thirdPlace;
      int p= machine.probability(0.1);
     
      if(p==1){
      firstPlace= 0;
      secondPlace = 0;
      thirdPlace = 0;
      }
      else{
      firstPlace = int(random(6));
      secondPlace = int(random(6));
      thirdPlace = int(random(6));
      }
      machine.setSlotFruit(0,firstPlace);
      machine.setSlotFruit(1,secondPlace);
      machine.setSlotFruit(2,thirdPlace);
      
     //= totalScore + machine.getSlotScore()*machine.getFruitCount()*3(all the same)
     if (firstPlace == secondPlace && secondPlace ==thirdPlace  ) {
        totalScore = totalScore
        + machine.getSlotScore(firstPlace)*9;
      }
     //= totalScore + machine.getSlotScore()*machine.getFruitCount()*2+ another machine.getSlotScore()
     // having two same 
      else if(firstPlace == secondPlace){
        totalScore =  totalScore
        + machine.getSlotScore(firstPlace)*4
        + machine.getSlotScore(thirdPlace);
      }
      else if(firstPlace == thirdPlace){
        totalScore =  totalScore
        + machine.getSlotScore(firstPlace)*4 
        + machine.getSlotScore(secondPlace);
      }
      else if(secondPlace == thirdPlace){
        totalScore =  totalScore
        + machine.getSlotScore(thirdPlace)*4 
        + machine.getSlotScore(firstPlace);
        
      }
      else{
        totalScore=  totalScore
        + machine.getSlotScore(firstPlace)
        + machine.getSlotScore(secondPlace)
        + machine.getSlotScore(thirdPlace);
      }
      
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







