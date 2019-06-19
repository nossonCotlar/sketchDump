float sinInc = 0;
float mag = 250;
float incSpeed = .05;
float x, y = 0;
color nigga = color(200, 0, 255);
color bg = color(0, 0, 0, 100);

void setup(){
fullScreen();
frameRate(30);
colorMode(HSB);

background(0);

noStroke();


}


void draw(){
  fill(bg);
  
  rect(0, 0, width, height);
  
  translate(width / 2, height / 2);
  //background(0);
  
  
  
  for(int i = 0; i < 300; i++){
    fill(nigga);
  
  x = map(sin(sinInc), -1, 1, -400, 400);
  
  circle(x, y, sin(sinInc) * mag);
  
  sinInc += incSpeed;
  
  y += 3;
  
  if(y > height / 2){
   y =  - height / 2;
  }
  
  nigga = color(map(sin(sinInc), -1, 1, 0, 255), 255, 255);
  }
  
  noLoop();
}
