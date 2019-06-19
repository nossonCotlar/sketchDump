import processing.sound.*;
Amplitude amplitude;
FFT fft;
AudioIn in;




void setup() {
  fullScreen(P3D);
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

  s = loadShape("star.obj");
  lights();
}

void draw() {
  background(150, 255, 0);
  ambientLight(102, 102, 102);

  soundStuffs1();
  //newSound();

  depthCalc();

  translate(width / 2, height / 2);
  rot();
  translate(-w / 2, -h / 2);

  showPlane();
    directionalLight(255, 255, 255, 1000, 1000, 400);
  ambientLight(102, 102, 102);

showShape();

  control();
  

}

void keyPressed(){
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
