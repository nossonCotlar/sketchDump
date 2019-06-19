int bw = 7; //<>//
int amount = 30;
int x, y, xT, yT;

int i = 0;
color strokeCol, fillCol;
int hueChangeVal = 80;
int currentX, currentY, startX, startY;

int yeetX = 1, yeetY = 1, yeetS = 1;
int moveSpeed = 5;
float r = .00;
float rotNum = .02;


void setup() {
  size(1500, 900);
  background(0);
  fill(255, 255, 255);
  frameRate(60);
  stroke(255);
  strokeWeight(1);
  rectMode(CENTER);
  colorMode(HSB, 255, 255, 255);
  

  strokeCol = color(0);
  fillCol = color(0, 255, 255);
  stroke(strokeCol);
  fill(fillCol);

  currentX = int(random(width));
  currentY = int(random(height));

  startX = width / 2;
  startY = height / 2;
}



void draw() {
 
  background(255, 0);
  
  xT = mouseX;
  yT = mouseY;
  
  x = int(lerp(x, xT, .1));
  y = int(lerp(y, yT, .1));
  
  translate(x, y);
  
  rect(0, 0, 100, 100);
  //fullQuad(0, 0, amount);
  

  
  //noLoop();
  
}
