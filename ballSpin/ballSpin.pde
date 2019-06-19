Ball[] balls;
int amt = 200;
float rot = -.4;
int rad = 600;

color bgCol = color(0, 25);

void setup() {
  fullScreen(P3D); 
  background(0);

  lights();
  fill(255);
  noStroke();

  balls = new Ball[amt];
  for (int i = 0; i < amt; i++) {
    balls[i] = new Ball(15, 600, .05, 10, random(TWO_PI), random(1000));
  }
}

void draw() {
  //background(0);

  pushMatrix();
  translate(width / 2, height / 2, -500);
  rotateX(rot);
  control();

  thing();
  popMatrix();

  fill(bgCol);

  rect(0, 0, width, height);
}

void thing() {
  for (int i = 0; i < amt; i++) {
    balls[i].update();
    balls[i].show();
  }
}

void control() {
  if (keyPressed) {
    switch (key) {
    case 'm':
      rot += .01;
      break;
    case 'k':
      rot -= .01;
      break;
    case 'z':
      rad -= 3;
      break;
    case 'x':
      rad += 3;
      break;
    }
  }
}
