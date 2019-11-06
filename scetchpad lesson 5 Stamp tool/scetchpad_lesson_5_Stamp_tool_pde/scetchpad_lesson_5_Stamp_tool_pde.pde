  
//check website for criteria
color blue   = #1000FF;
color yellow = #FFFF00;
color orange = #FFAA00;
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

PImage thanos;

void setup() {
  size (800, 600);
  background(white);
  sliderY = 350;
  thanos = loadImage("thanos.png");
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
  rect (0, 0, 150, 600);


 if (dist(90, 80, mouseX, mouseY) < 10) {
    fill(176, 255, 121);
 } else{
    fill(green);
  }
 
 ellipse( 90, 80, 25, 25);
 
 
 if (dist(110, 100, mouseX, mouseY) < 10) {
    fill(121, 140, 255);
 } else{
  fill(blue);
  }
 
  ellipse(110, 100, 25, 25);
 
  
  if (dist(65, 70, mouseX, mouseY) < 10) {
    fill(255, 245, 165);
  } else{
  fill(yellow);
  }
  
 ellipse( 65, 70, 25, 25);
  
if (dist(65, 100, mouseX, mouseY) < 10) {
    fill(88, 88, 88);
} else{
 fill(black);
  }
  
  ellipse(65, 100, 25, 25);
  
  if (dist(40, 80, mouseX, mouseY) < 10) {
    
  fill(255, 206, 70);
  } else {
    fill(orange);
  }
  ellipse(40, 80, 25, 25);
  
  
  if (mouseX > 10 && mouseX < 60 && mouseY > 520 && mouseY < 545) {
    fill(255, 244, 144);
  } else{
    fill(yellow);
  }
 
 rect(10, 520, 60, 25); //load button
 rect(10, 515, 30, 5);
 fill(blue);
 rect(20, 532, 5, 15);
 rect(20, 532, 40, 5);
 rect(55, 532, 5, 15);
 
 
 if (mouseX > 10 && mouseX < 50 && mouseY > 550 && mouseY < 590) {
    fill(160, 144, 1255);
 } else{
   fill(blue);
  }
 
 rect(10, 550, 40, 40); //save button
 fill(white);
 rect(15, 551, 30, 25);
 fill(grey);
 rect(18, 578, 23, 12);
 fill(blue);
 rect(23, 580, 5, 8);
  
  
  if (dist(20, 100, mouseX, mouseY) < 10) {
    fill(255, 113, 113);
} else {
  fill(red);
  
}
  ellipse(20, 100, 25, 25);
  
  if (mouseX > 60 && mouseX < 90 && mouseY > 200 && mouseY < 230) {
   fill(106, 149, 255);
  } else{
    fill(blue);//eraser
  }
  
  
  rect(60, 200, 30, 20);
  
  fill(white);//eraser
  rect(90, 201, 10, 18);

  line(50, 300, 50, 400);
  ellipse(50, sliderY, 25, 25);
  


  image(thanos, 50, 450, 50, 50);

  if (mousePressed && mouseX > 150 ) {
    println("?");
    if (tool == 0) {
      stroke(penColor);
      strokeWeight(thickness);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    if (tool == 1) {
      image(thanos, mouseX, mouseY, thickness+100, thickness+100);
    }
  }
}

void mouseReleased() {
  
  if (dist(65, 100, mouseX, mouseY) < 10) {
    penColor = black;
    tool = 0;
  }
  
  if (dist(20, 100, mouseX, mouseY) < 10) {
    penColor = red;
    tool = 0;
  
  }
  
  if (dist(110, 100, mouseX, mouseY) < 10) {
    penColor = blue;
    tool = 0;
  
  }
  
  if (dist(65, 70, mouseX, mouseY) < 10) {
    penColor = yellow;
    tool = 0;
  
  }
  
  if (dist(50, 450, mouseX, mouseY) < 35) {
    tool = 1;
  }
  
  if (dist(90, 80, mouseX, mouseY) < 10) {
    penColor = green;
    tool = 0;
    
  }  
  
  if (dist(40, 80, mouseX, mouseY) < 10) {
    penColor = orange;
    tool = 0;
    
  }

if (mouseX > 60 && mouseX < 90 && mouseY > 200 && mouseY < 230) {
   penColor = white;
    tool = 0; 
  }
  
  if (mouseX > 10 && mouseX < 60 && mouseY > 520 && mouseY < 545) {
    selectInput("PICK A FILE", "openImage");
  }
  
  if (mouseX > 10 && mouseX < 50 && mouseY > 550 && mouseY < 590) {
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
