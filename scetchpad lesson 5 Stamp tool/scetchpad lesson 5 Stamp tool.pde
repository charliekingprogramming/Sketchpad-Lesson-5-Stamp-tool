//check website for criteria
//make colours in a rainbow shape
//12min 50sec through lesson 5:stamp tool


color white = #FFFFFF;
color black = #000000;
color grey = #555555;
color penColor = black;
float sliderY;
float thickness = 1;
int tool = 1;
//0 means pen
//1 means trollface stamp

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


  strokeWeight(1);
  stroke(black);
  fill(150);
  rect (0, 0, 100, 600);

  fill(white);
  ellipse(50, 50, 25, 25);

  fill(black);
  ellipse(50, 50, 25, 25);

  line(50, 300, 50, 400);
  ellipse(50, sliderY, 25, 25);

  image(trollface, 50, 450, 50, 50);

  if (mousePressed && mouseX > 100 ) {
    println("?");
    if (tool == 0) {
      stroke(penColor);
      strokeWeight(thickness);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    if (tool == 1) {
      image(trollface, mouseX, mouseY, thickness+10, thickness+10);
    }
  }
}

void mouseReleased() {
  if (dist(50, 50, mouseX, mouseY) < 10) {
    penColor = white;
    tool = 0;
  }
  if (dist(50, 80, mouseX, mouseY) < 10) {
    penColor = black;
    tool = 0;
  }
  if (dist(50, 450, mouseX, mouseY) < 35) {
    tool = 1;
  }




  //strokeWeight(1);
  //stroke(black);
  //fill(150);
  //rect (0, 0, 100, 600);
}
