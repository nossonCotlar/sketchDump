int amount = 50;
float rotX = 0;

Box[] yeet = new Box[amount];


void setup() {

  fullScreen(P3D);
  frameRate(60);
  colorMode(HSB, 255, 255, 255, 255);

  stroke(0);
  strokeWeight(3);

  for (int i = 0; i < amount; i++) {
    yeet[i] = new Box(int(random(50, 250)));
    //yeet[i].z = i * 40;
  }


  rectMode(CENTER);
}

void draw() {
  background(0);

  rotateY(rotX);

  for (int i = 0; i < amount; i ++) {
    pushMatrix();
    yeet[i].bounce();
    yeet[i].place();
    yeet[i].rot();
    yeet[i].fly();

    yeet[i].display();

    popMatrix();

    //control();
  }

  //fill(0, 0, 0, 20);
  //rect(width / 2, height / 2, width, height);
  control();
}

void control() {
  if (keyPressed) {
    switch(key) {
    case 'm':
      rotX += .05;
      break;
    case 'n':
      rotX -= .05;
      break;
    default:
      break;
    }
  }
}
