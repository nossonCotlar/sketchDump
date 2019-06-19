
void depthCalc() {
  float noiseY = move;
  for (int y = 0; y < rows; y++) {
    float noiseX = 0;
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(noiseX, noiseY), 0, 1, -amp, amp);
      noiseX += density;
    }
    noiseY += density;
  }

  move -= speed;
}

void showPlane() {
  for (int y = 0; y < rows - 1; y++) {
    beginShape(POINTS);
    for (int x = 0; x < cols; x++) {
      vertex(x * space, y * space, z[x][y]);
      vertex(x * space, (y + 1) * space, z[x][y + 1]);
    }
    endShape();
  }
}

void rot() {
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
}

void soundStuffs1() {
  
    sound += (amplitude.analyze() - sound) * smooth;

  strokeCol = color(map(sound, 0, 1, 80, -180), 255, 255);

  stroke(strokeCol);
  strokeWeight(map(sound, 0, 1, 2, 8));
  amp = map(sound, 0, 1, 0, 1000); 
  speed = map(sound, 0, 1, 0.1, .8);

}

void newSound(){
  fft.analyze(spectrum);
    sound += (spectrum[band] - sound) * smooth;

  strokeCol = color(map(sound, 0, 1, 80, -180), 255, 255);

  stroke(strokeCol);
  strokeWeight(map(sound, 0, 1, 2, 8));
  amp = map(sound, 0, 1, 0, 1000); 
  speed = map(sound, 0, 1, 0.1, .8);
}

void soundScale() {
  
  scale(map(sound, 0, 1, .2, 2));
}

void showShape(){
   pushMatrix();
  translate(w / 2, h / 2, 300);
rotateZ(starRot);
  rotateX(radians(90));
  rotateY(radians(90));
  soundScale();
  lights();


  shape(s, 0, 0);

  shininess(100);
  specular(100);

  starRot += map(sound, 0, 1, .003, .05);
  popMatrix(); 
}
