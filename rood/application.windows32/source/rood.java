import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class rood extends PApplet {


int amount = 30;
int bw = 15;
int i = 0;
int strokeCol, fillCol;
int hueChangeVal = 80;
int currentX, currentY, startX, startY;

int yeetX = 1, yeetY = 1, yeetS = 1;
int moveSpeed = 5;
float r = .00f;
float rotNum = .02f;


public void setup() {
  
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

  currentX = PApplet.parseInt(random(width));
  currentY = PApplet.parseInt(random(height));

  startX = width / 2;
  startY = height / 2;
}



public void draw() {
 
  background(0);
  
  translate(width / 2, height / 2);
  fullQuad(0, 0, amount);
  
}
public void VCRThing(){
 fullQuad(currentX, currentY, amount);

  if (currentX <= 0 || currentX >= width) {
    yeetX = yeetX * -1;
    stroke(random(255), 255, 255);
  }
  if (currentY <= 0 || currentY >= height) {
    yeetY = yeetY * -1;
    stroke(random(255), 255, 255);
  }


  currentX += (moveSpeed + 3) * yeetX;
  currentY += moveSpeed * yeetY; 
}
public void changeHue(int x) {
  if (hue(strokeCol) >= 255) {
    strokeCol = color(0, 255, 255);
  }
  strokeCol = color(hue(strokeCol) + x, 255, 255);
  stroke(strokeCol);
}
public void fullQuad(int x, int y, int num) {
  printQuad(1, x, y, num);
  printQuad(2, x, y, num);
  printQuad(3, x, y, num);
  printQuad(4, x, y, num);
}

public void printQuad(int quad, int x, int y, int num) {

  switch (quad) {
  case 1:
    quad1(x, y, num);
    break;

  case 2:
    quad2(x, y, num);
    break;

  case 3:
    quad3(x, y, num);
    break;

  case 4:
    quad4(x, y, num);
    break;

  default:
    println("No such quadrant exists :3" );
  }
}

public void quad1(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x + (i * bw);
    currentY = y - (num * bw) + (i * bw);
    line(x, currentY, currentX, y);
  }
}
public void quad2(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x + (i * bw);
    currentY = y + (num * bw) - (i * bw);
    line(x, currentY, currentX, y);
  }
}

public void quad3(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x - (i * bw);
    currentY = y + (num * bw) - (i * bw);
    line(x, currentY, currentX, y);
  }
}

public void quad4(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x - (i * bw);
    currentY = y - (num * bw) + (i * bw);
    line(x, currentY, currentX, y);
  }
}
  public void settings() {  size(1500, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rood" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
