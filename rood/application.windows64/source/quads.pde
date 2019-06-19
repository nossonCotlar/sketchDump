void fullQuad(int x, int y, int num) {
  printQuad(1, x, y, num);
  printQuad(2, x, y, num);
  printQuad(3, x, y, num);
  printQuad(4, x, y, num);
}

void printQuad(int quad, int x, int y, int num) {

  switch (quad) {
  case 1:
    quad1(x, y, num);
    break;

  case 2:
    quad2(x, y, num);
    break;

  case 3:
    quad3(x, y, num);
    break;

  case 4:
    quad4(x, y, num);
    break;

  default:
    println("No such quadrant exists :3" );
  }
}

void quad1(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x + (i * bw);
    currentY = y - (num * bw) + (i * bw);
    line(x, currentY, currentX, y);
  }
}
void quad2(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x + (i * bw);
    currentY = y + (num * bw) - (i * bw);
    line(x, currentY, currentX, y);
  }
}

void quad3(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x - (i * bw);
    currentY = y + (num * bw) - (i * bw);
    line(x, currentY, currentX, y);
  }
}

void quad4(int x, int y, int num) {
  int currentX, currentY;
  for (int i = 0; i <= num; i++) {
    currentX = x - (i * bw);
    currentY = y - (num * bw) + (i * bw);
    line(x, currentY, currentX, y);
  }
}
