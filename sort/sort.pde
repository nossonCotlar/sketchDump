int amt = 250;

int w = 2;
int bw = 1;
int size = 5;
int i = -1;

Bars boi;

void setup() {
  fullScreen();
  rectMode(CENTER);
  frameRate(60);
  colorMode(HSB, 255, 255, 255);

  boi  = new Bars(amt, w, size, bw);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

if (i < 0) {
   boi.setCol();
    boi.scramble();
    i = boi.num - 1;
   
  }

  if (i >= 0) {
    boi.sort0(i);
    i--;
  }
  boi.show();

  
}
