class Rood {

  int bw;
  int size;
  color strokeCol;
  float hueVal;

  int startX, startY;

  Rood() {
    
    size = 20;
    bw = 20;
    strokeCol = color(255, 255, 255);
    hueVal = hue(strokeCol);
    
    stroke(strokeCol);
    
    startX = width / 2;
    startY = height / 2;
  }


  void quad1() {
    int currentX, currentY;
    for (int i = 0; i <= size; i++) {
      currentX = startX + (i * bw);
      currentY = startY - (size * bw) + (i * bw);
      line(startX, currentY, currentX, startY);
    }
  }
  void quad2() {
    int currentX, currentY;
    for (int i = 0; i <= size; i++) {
      currentX = startX + (i * bw);
      currentY = startY + (size * bw) - (i * bw);
      line(startX, currentY, currentX, startY);
    }
  }

  void quad3() {
    int currentX, currentY;
    for (int i = 0; i <= size; i++) {
      currentX = startX - (i * bw);
      currentY = startY + (size * bw) - (i * bw);
      line(startX, currentY, currentX, startY);
    }
  }

  void quad4() {
    int currentX, currentY;
    for (int i = 0; i <= size; i++) {
      currentX = startX - (i * bw);
      currentY = startY - (size * bw) + (i * bw);
      line(startX, currentY, currentX, startY);
    }
  }
}
