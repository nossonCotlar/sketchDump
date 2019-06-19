//q / w - movement speed
//
//o / p - rotation x
//k / l - rotation y
//n / m - rotation z
//
//a / s - density
//z / x - amplitude
//h - hue
//
void control() {
  if (keyPressed) {
    switch(key) {
    case 'q':
      speed -= 0.0005;
      break;
    case 'w':
      speed += 0.0005;
      break;
    case 'o':
      rotX += 0.005;
      break;
    case 'p':
      rotX -= 0.005;
      break;
    case 'k':
      rotY += 0.005;
      break;
    case 'l':
      rotY -= 0.005;
      break;
    case 'm':
      rotZ += 0.005;
      break;
    case 'n':
      rotZ -= 0.005;
      break;
    case 'a':
      density -= 0.001;
      break;
    case 's':
      density += 0.001;
      break;
    case 'z':
      amp -= 1;
      break;
    case 'x':
      amp += 1;
      break;
    case 'h':
      strokeCol = color(hue(strokeCol) + 1, 255, 255);
      break;
    case 'g':
      border += 1;
      if (border > space - 1) {
        border = space - 1;
      }
      delay(30);
      break;
    case 'f':
      border -= 1;
      if (border < 1) {
        border = 1;
      }
      delay(30);
      break;
    }
  }
}
