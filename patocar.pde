boolean isPatocar() {
  if (traffic == 0 && 1520 <= ballPos && ballPos <= 1580) {
    println("load");
    sirenSE();
    return true;
  } else {
    return false;
  }
}

void patocar() {
  int turnPos = 1540;
  if (isPatocar) {
    if (0 <= patPos && patPos <= turnPos) {
      translate(xPosition(patPos), yPosition(patPos)+30);
      rotate(radians(180));
      image(patocar, 0, 0, 100, 100);
      translate(-xPosition(patPos), -yPosition(patPos)-30);
    } else{
      translate(xPosition(patPos)-20, yPosition(patPos)+80);
      rotate(radians(160));
      scale(-1,1);
      image(patocar, 0, 0, 100, 100);
      translate(-xPosition(patPos), -yPosition(patPos)-80);
    }
  }
}
