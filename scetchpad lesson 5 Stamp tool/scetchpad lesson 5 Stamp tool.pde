color white = #FFFFFF;
color black = #000000;
color grey = #555555;
color penColor = black;
float sliderY;
float thickness = 1;
int tool = 1;

PImage trollface;

void setup() {
  size (800, 600);
  background(grey);
  sliderY = 350;
  trollface = loadImage("trollface.png");
  imageMode(CENTER);
}

void draw() {
  thickness = map(sliderY, 300, 400, 50, 1);
  
  
  if (mousePressed) {
    if (dist(50, sliderY, mouseX, mouseY) < 25) {
      sliderY = mouseY;
      if (sliderY > 400) sliderY = 400;
      if (sliderY < 300) sliderY = 300;
    }
  } 
  if(mousePressed) { 
    if (tool == 0) {
      stroke(penColor);
      strokeWeight(thickness);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    
    if (tool == 1) {
      image(trollface, mouseX, mouseY, 200, 200);
    
    }
    
  }
  
 
  strokeWeight(1);
  stroke(black);
  
    
    
    
    
    
    
