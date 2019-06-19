Rood rood;

void setup() {
  size(1500, 900);
  background(0);
  colorMode(HSB, 255, 255, 255);

  rood = new Rood();

  fill(255, 255, 255);
  frameRate(60);
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);

  rood.size = 30;
}

void draw() {
  background(0);
  rood.quad1();
}
