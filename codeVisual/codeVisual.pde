PFont font;
String[] lines;
int amt;
color bg = color(0, 0, 0, 10);
int speed = 1;

void setup() {
  fullScreen();
  lines = loadStrings("code.txt");
  amt = lines.length;
  font = loadFont("font.vlw");
  textFont(font, 32);
  textSize(32);
  //textMode(CENTER);
  background(0);
}

void draw() {
  //background(0);
  fill(bg);
  rect(0, 0, width, height);
  flash();
  

  fill(0, 255, 0);
  if (random(4) < 1) fill(255, 0, 0);
  if (frameCount % speed == 0) {
    text(lines[int(random(amt))], random(width) - 300, random(height));
    text(lines[int(random(amt))], random(width) - 300, random(height));
  }
wordFlash("ROOD");
  control();
}


void flash() {
  if (keyPressed && key == ' ') {
    if (frameCount % 4 == 0) {
      background(255);
    } else background(0);
  }
}

void wordFlash(String x) {
  
  if (keyPressed && key == 'q') {
    textSize(400);
    if (frameCount % 3 == 0) {
      fill(255);
    } else fill(0);
    text(x, width / 2 - 400, height / 2 + 100);

    textSize(32);
  }
}

void control() {
  if (keyPressed) {
    switch(key) {
    case 'p':
      if (speed > 1) {
        speed--;
      }
      break;
    case 'o':
      if (speed < 10) {
        speed++;
      }
      break;
    }
  }
}
