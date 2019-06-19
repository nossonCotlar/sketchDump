PShape s;

float rot = 0;
int amount = 50;


Box[] yeet;

void setup() {
  fullScreen(P3D);
  rectMode(CENTER);
  colorMode(HSB, 255, 255, 255);
  background(0);
  strokeWeight(3);
  
  s = loadShape("rood.obj");

  yeet = new Box[amount];

  for (int i = 0; i < amount; i++) {
    yeet[i] = new Box();
  }
}

void draw() {
  //pushStyle();
  //fill(0, 5);
  //rect(width / 2, height / 2, width, height);
  //popStyle();
  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  control();
  rotateY(rot);

  for (int i = 0; i < amount; i++) {
    yeet[i].show();
  }
  popMatrix();
}

void control(){
 if(keyPressed){
  switch(key){
   case 'm':
   rot -= .02;
   break;
   case 'n':
   rot += .02;
   break;
  }
 }
}
