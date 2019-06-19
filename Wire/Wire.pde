PShape rood;
PImage img;
float rotX = 0, rotY = 0;

void setup() {
  fullScreen(P3D);
  background(0);

  colorMode(RGB, 255, 255, 255);
  rectMode(CENTER);

  rood = loadShape("rood.obj");
  img = loadImage("purp.jpg");

  //rood.setTexture(img);
  
   rood.setStroke(true);
  rood.setStroke(color(0, 255, 0)); 
  rood.setStrokeWeight(2);             
  rood.setFill(false);
}

void draw() {
  background(0, 100);

 

  control();
  
  showRood(-1000, -300);
  showRood(-350, -300);
  showRood(300, -300);
  showRood(950, -300);
  
  showRood(-1000, 350);
  showRood(-350, 350);
  showRood(300, 350);
  showRood(950, 350);


rotX += .1;
rotY += .05;
}

void control() {
  if (keyPressed) {
    switch (key) {
    case 'm':
      rotX += .1;
      break;
    case 'n':
      rotX -= .1;
      break;
    case 'b':
      rotY += .1;
      break;
    case 'v':
      rotY -= .1;
      break;
    }
  }
}

void showRood(int x, int y){
  pushMatrix();
  translate(width / 2 + x, height / 2 + y, -200);
  scale(45);
  rotateX(rotX);
  rotateY(rotY);
  shape(rood, 0, 0);
  popMatrix();
}
