class Ball {
  float r, a, x, y, z;
  float spinSpeed, liftSpeed;
  float startZ = 1000;
  int size;
  color fillCol;

  Ball(int size, float r, float spinSpeed, float liftSpeed, float startA, float startZ) {
    this.size = size;
    this.r = r;
    this.a = startA;
    this.z = startZ + this.startZ;
    this.spinSpeed = random(spinSpeed / 2, spinSpeed);
    this.liftSpeed = random(liftSpeed, liftSpeed * 4);
    fillCol = color(random(255), random(255), random(255));
  }
  
    
  void spin(){
    x = rad * cos(a);
    y = rad * sin(a);
    if(a <= -TWO_PI){
     a = 0; 
    }
    a -= spinSpeed;
  }
  
  void lift(){
    if(z <= -1000){
     z = 2000; 
    }
    z -= liftSpeed;
  }
    void update(){
   spin(); 
   lift();
  }
  
  void show() {
    fill(fillCol);
    pushMatrix();
    translate(x, z, y);
    //sphere(size); 
    circle(0, 0, size);
    popMatrix();
  }
}
