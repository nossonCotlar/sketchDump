enum Sides { 
  U, D, R, L
}

float x1, y1, x2, y2;
float c1 = 0, c2 = 0, c3 = 0, c4 = 0;
float inc1 = 0, inc2 = 1000, inc3 = 500;
float speed = .0005;


void setup() {
  fullScreen();
  background(0);
  strokeWeight(1);
  stroke(200);
  frameRate(30);
  fill(200);
}

void draw() {
  control();

 
    assign();
    stroke(map(y1, 0, height, 0, 255), map(x2, 0, width, 0, 255), map(x1, 0, width, 0, 255)); 

    //if (rule())
      line(x1, y1, x2, y2);

    inc1 += speed;
    inc2 += speed;
    inc3 += speed;
  
}


boolean rule() {

  if (x1 == x2 || y1 == y2 || x1 == y1 || x2 == y2 || x2 == y1 || x1 == y2) {
    return false;
  } else return true;
}

void control() {
  if (keyPressed) {
    switch(key) {
    case 'q':
      c1++;
      break;
    case 'w':
      c2++;
      break;
    case 'e':
      c3++;
      break;
    case 'r':
      c4++;
      break;
      case 'z':
      speed+=.0002;
      break;
      case 'x':
      speed-=.0002;
      break;
      case 'c':
      speed = 0;
      break;
    }
  }
}

void assign() {
  int t1 = int(random(4));
  int t2;
  do {
    t2 = int(random(4));
  } while (t2 == t1);

  switch (t1) {
  case 0:
    y1 = 0;
    x1 = map(noise(inc1), 0, 1, 0, width);
    break;
  case 1:
    y1 = height;
    x1 = map(noise(inc1), 0, 1, 0, width);
    break;
  case 2:
    x1 = 0;
    y1 = map(noise(inc3), 0, 1, 0, height);
    break;
  case 3:
    x1 = width;
    y1 = map(noise(inc3), 0, 1, 0, height);
    break;
  }

  //inc += speed;

  switch (t2) {
  case 0:
    y2 = 0;
    x2 = map(noise(inc1), 0, 1, 0, width);
    break;
  case 1:
    y2 = height;
    x2 = map(noise(inc2), 0, 1, 0, width);
    break;
  case 2:
    x2 = 0;
    y2 = map(noise(inc3), 0, 1, 0, height);
    break;
  case 3:
    x2 = width;
    y2 = map(noise(inc2), 0, 1, 0, height);
    break;
  }
}

void keyPressed(){
  if(key == ' ')
  background(0);
  if(key == 'p')
  saveFrame();
  if(key == 'r'){
   inc1 = random(2000);
   inc2 = random(2000);
   inc3 = random(2000);
  }
}
