Box[] boxes;
final int amt = 75;
float speedFactor = 1;
int trans = 10;
color bg = color(0, 0, 0, trans);

float x = 0, y = 0, z = 0;

void setup() {
  colorMode(HSB);
  rectMode(CENTER);
  fullScreen(P3D); 
  //noStroke();

  boxes = new Box[amt];
  for (int i = 0; i < amt; i++) {
    boxes[i] = new Box();
  }
}

void draw() {
  //background(0);
  fill(bg);
  rect(width / 2, height / 2, width, height);
  
  //translate(0, 0, -300);
  rotateX(x);
   rotateY(y);
  rotateZ(z);
  boxesUpdate();
  control();
}

void boxesUpdate() {
  for (int i = 0; i < amt; i++) {
    boxes[i].update();
  }
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
      case 'w':
      x -= .01;
      break;
      case 'a':
      y -= .01;
      break;
      case 's':
      x += .01;
      break;
      case 'd':
      y += .01;
      break;
      case '1':
      speedFactor = .1;
      break;
      case '2':
      speedFactor = .3;
      break;
      case '3':
      speedFactor = .5;
      break;
      case '4':
      speedFactor = .8;
      break;
      case '5':
      speedFactor = 1;
      break;
      case '6':
      speedFactor = 2;
      break;
      case '7':
      speedFactor = 4;
      break;
      case '8':
      speedFactor = 7;
      break;
      case '9':
      speedFactor = 10;
      break;
    }
  }
}
