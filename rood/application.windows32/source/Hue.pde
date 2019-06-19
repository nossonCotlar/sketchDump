void changeHue(int x) {
  if (hue(strokeCol) >= 255) {
    strokeCol = color(0, 255, 255);
  }
  strokeCol = color(hue(strokeCol) + x, 255, 255);
  stroke(strokeCol);
}
