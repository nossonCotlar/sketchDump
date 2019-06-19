void VCRThing(){
 fullQuad(currentX, currentY, amount);

  if (currentX <= 0 || currentX >= width) {
    yeetX = yeetX * -1;
    stroke(random(255), 255, 255);
  }
  if (currentY <= 0 || currentY >= height) {
    yeetY = yeetY * -1;
    stroke(random(255), 255, 255);
  }


  currentX += (moveSpeed + 3) * yeetX;
  currentY += moveSpeed * yeetY; 
}
