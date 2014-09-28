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


// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/acmesa.ttf", 36));
  machine = new SlotMachine();
}

void draw() {
  background(0);
  // draw button
  fill(127);
  rectMode(CENTER);
  rect(x,y,w,h);
  // show title
  textSize(36);
  fill(255,255,255);
  textAlign(CENTER, CENTER);
  text("Slot Machine",x,20);
  text("Score:"+totalScore,x, 60);
  textSize(30);
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here


      // -------------------------------------------------
    }
    machine.roll();
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
      






      
      // -------------------------------------------------
    }
    machine.stop();
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}







