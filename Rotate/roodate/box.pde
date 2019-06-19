class Box {

  int size;
  color col;
  int x, y, z;
  int fallRate;
  float boom;
  PShape rood;

  Box() {
    rood = loadShape("rood.obj");

    size = int(random(6, 20)); 
    col = color(random(255), 255, 255, 255);
    x = int(random(-width / 2, width / 2));
    y = int(random(-height / 2, height / 2));
    z = int(random(-800, 800));
    
    fallRate = int(random(10, 35));
    boom = 0;
  }

  void show() {
    lights();
    ambientLight(255, 255, 255);
rood.setFill(col);
    fall();
    pushMatrix();
    translate(x, y, z);
    rotateX(boom);
    rotateY(boom);
scale(size);
rood.noTexture();
    shape(rood, 0, 0); 

    popMatrix();
    boom += .05;
  }

  void fall() {
    if (y >= 1000) {
      x = int(random(-width / 2, width / 2));
      y = -600;
    }
    y += size * 5;
  }
}
