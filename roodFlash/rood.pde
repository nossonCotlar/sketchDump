class Rood {
  PImage rood;
  final int size = 200;
  final int offset = 40;
  float speed;
  float x, y;
  int xMove, yMove;

  Rood() {
    rood = loadImage("rood.png");
    rood.resize(size, size);
    x = random(1, width);
    y = random(1, height);
    if (int(random(2)) % 2 == 0) {
      xMove = 1;
    } else xMove = -1;
    if (int(random(2)) % 2 == 0) {
      yMove = 1;
    } else yMove = -1;

    speed = random(5, 20);
  }

  void update() {
    move();
    show();
  }

  void move() {
    if (x <= 0 || x >= width) {
      xMove *= -1;
    }
    if (y <= 0 || y >= height) {
      yMove *= -1;
    }
    x += speedFactor * speed * xMove;
    y += speedFactor * speed * yMove;
  }

  void show() {
    image(rood, x, y);
  }
  
  void reset(){
   x = random(1, width);
   y = random(1, height); 
  }
}

class Roods {
  Rood[] roods;
  int amt;

  Roods(int x) {
    amt = x;
    roods = new Rood[x];
    for (int i = 0; i < x; i++) {
      roods[i] = new Rood();
    }
  }

  void update() {
    for (int i = 0; i < amt; i++) {
      roods[i].update();
    }
  }
  void reset(){
    for (int i = 0; i < amt; i++) {
      roods[i].reset();
    }
  }
}
