Roods roods;
final int amt = 20;
float trans = 20;
float speedFactor = 1;
color bg = color(0, 0, 0, trans);

void setup() {
  fullScreen();
  colorMode(HSB);
  imageMode(CENTER);

  roods = new Roods(amt);
  background(0);
}

void draw() {

  fill(bg);
  rect(0, 0, width, height);
  flash();

  roods.update();

  control();
}

void transAdd() {
  trans += 1;

  if (trans > 200) {
    trans = 200;
  }
  bg = color(0, 0, 0, trans);
}
void transSub() {
  trans -= 1;

  if (trans < 1) {
    trans = 1;
  }
  bg = color(0, 0, 0, trans);
}

void flash() {
  if (keyPressed && key == ' ') {
    if (frameCount % 4 == 0) {
      background(255);
    } else background(0);
  }
}

void control() {
  if (keyPressed) {
    switch(key) {
    case 'm':
      transAdd();
      break;
    case 'n':
      transSub();
      break;
    case 'p':
      speedFactor += .05;
      break;
    case 'o':
      speedFactor -= .05;
      break;
      case 'r':
      roods.reset();;
      break;
    }
  }
}
