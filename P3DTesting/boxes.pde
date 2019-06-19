class Box {

  int size;
  float x, y, z;
  float rotVal, rotSpeed;
  int xBounce, yBounce, bounceSpeed;
  color fillCol;
  float h, s, b;
  int flySpeed;
  int middle;


  Box(int temp) {
    size = temp; 
    rotVal = random(0, 1);
    rotSpeed = random(0.01, 0.04);
    xBounce = 1;
    yBounce = 1;
    bounceSpeed = int(random(1, 10));
    b = 255;
    h = int(random(255));
    s = 255;
    flySpeed = 100;
    middle = 200;

    fillCol = color(h, s, b);

    x = int(random(size / 2, width - size / 2));
    y = int(random(size / 2, height - size / 2));
    z = int(random(-8000, 999));
  }

  void place() {
    translate(x, y, z);
  }

  void display() { 
    pushStyle();
    //h = random(255);
    fillCol = color(h, s, b, 100);
    fill(fillCol);
    box(size);
    popStyle();
  }

  void rot() {
    rotateX(rotVal);
    rotateY(-rotVal);
    rotVal += rotSpeed;
  }

  void bounce() {

    if (x <= 0 || x >= width) {
      xBounce *= -1; 
      //b = 255;
       h = random(255);
      fillCol = color(h, s, b);
    }
    if (y <= 0 || y >= height) {
      yBounce *= -1; 
      // b = 255;
      h = random(255);
      fillCol = color(h, s, b);
    }

    x += bounceSpeed * xBounce;
    y += bounceSpeed * yBounce;
    // b -= .3;
  }
  
  void spawnRandom(){
   

      x = int(random(width)); 

      y = int(random(height)); 

  }
  void fly() {
    if (z >= 1000) {
      z = -8000;
      spawnRandom();
    }
    z += flySpeed;
    //translate(x, y, z);
  }
}
