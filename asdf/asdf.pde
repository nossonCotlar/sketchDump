void setup() {
  size(1000, 1000);
  background(50);
}

void draw() {
}

void mousePressed() {
    stroke(255);
    rectMode(CENTER);
    rect(mouseX, mouseY, 200, 200);
}
