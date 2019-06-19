import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Mesh_Testing extends PApplet {


Amplitude amplitude;
FFT fft;
AudioIn in;




public void setup() {
  
  colorMode(HSB, 255, 255, 255);
  noFill();

  cols = w / space;
  rows = h / space;

  z = new float[cols][rows];

  amplitude = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amplitude.input(in);

  fft = new FFT(this, bands);
  fft.input(in);

  s = loadShape("jct.obj");
}

public void draw() {
  background(150, 255, 0);
  ambientLight(102, 102, 102);

  soundStuffs1();
  //newSound();

  depthCalc();

  translate(width / 2, height / 2);
  rot();
  translate(-w / 2, -h / 2);

  showPlane();

showShape();

  control();
  
  directionalLight(255, 255, 255, 1000, 1000, 400);
  ambientLight(102, 102, 102);
}

public void keyPressed(){
 switch (key){
  case '1' : 
  band--;
  if (band < 0){
   band = 0; 
  }
  break;
  case '2' : 
  band++;
  if (band > bands - 1){
   band = bands - 1; 
  }
  break;
 }
}
//q / w - movement speed
//
//o / p - rotation x
//k / l - rotation y
//n / m - rotation z
//
//a / s - density
//z / x - amplitude
//h - hue
//
public void control() {
  if (keyPressed) {
    switch(key) {
    case 'q':
      speed -= 0.0005f;
      break;
    case 'w':
      speed += 0.0005f;
      break;
    case 'o':
      rotX += 0.005f;
      break;
    case 'p':
      rotX -= 0.005f;
      break;
    case 'k':
      rotY += 0.005f;
      break;
    case 'l':
      rotY -= 0.005f;
      break;
    case 'm':
      rotZ += 0.005f;
      break;
    case 'n':
      rotZ -= 0.005f;
      break;
    case 'a':
      density -= 0.001f;
      break;
    case 's':
      density += 0.001f;
      break;
    case 'z':
      amp -= 1;
      break;
    case 'x':
      amp += 1;
      break;
    case 'h':
      strokeCol = color(hue(strokeCol) + 1, 255, 255);
      break;
    case 'g':
      border += 1;
      if (border > space - 1) {
        border = space - 1;
      }
      delay(30);
      break;
    case 'f':
      border -= 1;
      if (border < 1) {
        border = 1;
      }
      delay(30);
      break;
    }
  }
}
PShape s;
int cols, rows;
int w = 1000, h = 2000;
int space = 15;
float[][] z;
float sound;
int blah = -1;
float move = 0;
int border = 2;
int strokeCol = color(30, 255, 255);
float rotX = 1, rotY = 0, rotZ = 0;
float speed = 0.01f;
float density = 0.1f;
float amp = 100;
float starRot = 0;
int bands = 16;
float[] spectrum = new float[bands];
float sum = 0;
float smooth = .2f;

int band = 0;

public void depthCalc() {
  float noiseY = move;
  for (int y = 0; y < rows; y++) {
    float noiseX = 0;
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(noiseX, noiseY), 0, 1, -amp, amp);
      noiseX += density;
    }
    noiseY += density;
  }

  move -= speed;
}

public void showPlane() {
  for (int y = 0; y < rows - 1; y++) {
    beginShape(POINTS);
    for (int x = 0; x < cols; x++) {
      vertex(x * space, y * space, z[x][y]);
      vertex(x * space, (y + 1) * space, z[x][y + 1]);
    }
    endShape();
  }
}

public void rot() {
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
}

public void soundStuffs1() {
  
    sound += (amplitude.analyze() - sound) * smooth;

  strokeCol = color(map(sound, 0, 1, 80, -180), 255, 255);

  stroke(strokeCol);
  strokeWeight(map(sound, 0, 1, 2, 8));
  amp = map(sound, 0, 1, 0, 1000); 
  speed = map(sound, 0, 1, 0.1f, .8f);

}

public void newSound(){
  fft.analyze(spectrum);
    sound += (spectrum[band] - sound) * smooth;

  strokeCol = color(map(sound, 0, 1, 80, -180), 255, 255);

  stroke(strokeCol);
  strokeWeight(map(sound, 0, 1, 2, 8));
  amp = map(sound, 0, 1, 0, 1000); 
  speed = map(sound, 0, 1, 0.1f, .8f);
}

public void soundScale() {
  
  scale(map(sound, 0, 1, .2f, 2));
}

public void showShape(){
   pushMatrix();
  translate(w / 2, h / 2, 300);
rotateZ(starRot);
  rotateX(radians(90));
  rotateY(radians(90));
  soundScale();
  lights();


  shape(s, 0, 0);

  shininess(100);
  specular(100);

  starRot += map(sound, 0, 1, .003f, .05f);
  popMatrix(); 
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Mesh_Testing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
