void accel() {
  if (!clearFlag) {
    Ani.to(self, 0.2, "ballPos", ballPos+20);
    ballPos+=20;
    fragBall = millis();
  }
}
int turnPos = 1540;
int yPosition(int ballPos) {
  float ySize1 = height/2-50;
  float xSize1 = width-150;
  float tilt1 = ySize1/xSize1;
  float ySize2 = height-(height/2-300);
  float xSize2 = width;
  float tilt2 = ySize2/xSize2;
  if (0 <= ballPos && ballPos <= 150) {
    float y = 55;
    return int(y);
  }
  if (150 < ballPos && ballPos <= turnPos) {
    float y = tilt1*ballPos+15;
    return int(y);
  } else if (turnPos < ballPos) {
    float y = tilt2*ballPos-227;
    return int(y);
  }
  return(0);
}
int xPosition(int ballPos) {
  if (0 <= ballPos && ballPos <= turnPos) {
    int x = ballPos;
    return int(x);
  } else if (turnPos < ballPos) {
    int x = turnPos*2-ballPos;
    return int(x);
  }
  return(0);
}
