

PShape s;
float rot = 0;
float change = 100;


void setup(){
  fullScreen(P3D);
  //lights();
  s = loadShape("jct.obj");
  colorMode(HSB, 255, 255, 255);
  
  fill(65);
}

void draw(){
  background(0);
 
  lights();
  directionalLight(change, 255, change, 0, 0, -1);
 
  translate(width/2, height/2);
  rotateX(-.4);
  rotateY(rot);
  rotateZ(radians(180));
  
  shape(s, 0, 0);
  

  
  if(change <= 50 || change >= 255){
    change *= -1;
  }
  //change += 1;


rot += .01;
}
