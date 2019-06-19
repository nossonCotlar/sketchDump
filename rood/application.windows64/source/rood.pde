
int amount = 30;
int bw = 15;
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
  strokeWeight(2);
  rectMode(CENTER);
  colorMode(HSB, 255, 255, 255);
  

  strokeCol = color(0, 255, 255);
  fillCol = color(0, 255, 255);
  stroke(strokeCol);
  fill(fillCol);

  currentX = int(random(width));
  currentY = int(random(height));

  startX = width / 2;
  startY = height / 2;
}



void draw() {
 
  background(0);
  
  translate(width / 2, height / 2);
  fullQuad(0, 0, amount);
  
}
