public class Box {
  
  private float x, y;
  private float speed;
  private int direction;
  private color col;
  private float size;
  Box() {
    randAll();
  }

void update(){
 move();
 confide();
 show();
}

  void show() {
    fill(col);
    //rect(x, y, speed / 2, speed / 2, 10);
    pushMatrix();
    translate(x, y);
    box(speed / 2);
    popMatrix();
  }
  void move(){
    switch(direction){
     case 0:
     y -= speed * speedFactor;
     break;
     case 1: 
     y += speed * speedFactor;
     break;
     case 2:
     x += speed * speedFactor;
     break;
     case 3:
     x -= speed * speedFactor;
     break;
    }
  }
  void confide() {
    if (x < 0 || x > width || y < 0 || y > height) {
      randAll();
    }
  }
  void randX() {
    x = random(0, width);
  }
  void randY() {
    y = random(0, height);
  }
  void randSize(){
    size = random(7, 30);
  }
  void randDirection() {
    direction = int(random(0, 4));
  }
  void randCol() {
    col = color(random(0, 255), 255, 255);
  }
  void randSpeed(){
   speed = random(10, 50); 
  }
  void randAll(){
    randX();
    randY();
    randDirection();
    randCol();
    randSpeed();
    randSize();
  }
}
