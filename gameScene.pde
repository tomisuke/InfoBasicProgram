int clearTime = 0;
boolean clearFlag = false;
void gameDraw() {
  background(#cee6c1);
  textSize(27);
  translate(0, height);
  scale(1, -1);
  decoration();
  drawRoad();
  if (ballPos > 150 && millis()-fragBall >= 500) {
    Ani.to(self, 1/60, "ballPos", ballPos-1);
  }
  //traffic
  if (millis()-fragTraffic>=1500) {
    changeTraffic();
    fragTraffic = millis();
  }

  if (!isPatocar) {
    isPatocar = isPatocar();
  } else {
    patPos+=3;
    patocar();
  }
  if (ballPos<patPos) {
    scene = 3;
    flagPause = millis();
  }
  if (ballPos >= 2800 && !clearFlag) {
    clearFlag = true;
    unlock();
    Ani.to(self, 0.8, "ballPos", ballPos+500);
    ballPos += 500;
    clearTime = millis();
    println("実行");
  }
  if (clearFlag && millis()-clearTime >= 1500) {
    scene = 4;
  }
}
