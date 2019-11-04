//check website for criteria

color green = #00FF00;
color red   = #FF0000;
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
 
 fill(green);
 ellipse( 50, 150, 25, 25);
  

  fill(black);
  ellipse(50, 80, 25, 25);
  
  fill(red);
  ellipse(50, 200, 25, 25);

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
  
  if (dist(50, 200, mouseX, mouseY) < 10) {
    penColor = red;
    tool = 0;
  
  }
  if (dist(50, 450, mouseX, mouseY) < 35) {
    tool = 1;
  }
  
  if (dist(50, 150, mouseX, mouseY) < 10) {
    penColor = green;
    tool = 0;
    
  }  


  
  if (mouseX > 10 && mouseX < 60 && mouseY > 520 && mouseY < 545) {
    selectInput("PICK DA FILE, BRO <3", "openImage");
  }
  
  if (mouseX > 10 && mouseX < 60 && mouseY > 550 && mouseY < 545) {
    selectOutput("Save as...", "saveImage");
  }
}
    

void saveImage(File f) {
  if (f != null) {
    PImage canvas;
    canvas = get( 71, 1, width-71, height-1);
    canvas.save(f.getAbsolutePath());
  }
}


void openImage(File f) {
  if (f != null) {
    //KLUDGE
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getAbsolutePath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
}


  //strokeWeight(1);
  //stroke(black);
  //fill(150);
  //rect (0, 0, 100, 600);
