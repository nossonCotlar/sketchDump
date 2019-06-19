float rotX = 0;
float rotY = 0;
float rotZ = 0;

void setup() {
  fullScreen(P3D);
  lights();
  fill(255);

  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
 
  control();

  pushMatrix();

  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  for (int i = 0; i < 10; i++) {
    
  }
}

void control() {
  if (keyPressed) {
    switch(key) {
    case 'w':
      rotX += .01;
      break;
    case 's':
      rotX -= .01;
      break;
    case 'a':
      rotY -= .01;
      break;
    case 'd':
      rotY += .01;
      break;
    }
  }
}
