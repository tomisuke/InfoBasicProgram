void drawRoad() {
  //道
  stroke(100);
  strokeWeight(80);
  line(0, 0, 150, 0);
  line(150, 0, width, height/2-50);
  line(width, height/2-300, 0, height);
  stroke(255);
  //信号機
  fill(128);
  strokeWeight(5);
  rect(1600, 600, 300, 150);
  strokeWeight(0);
  fill(0);
  circle(1650, 675, 80);
  circle(1750, 675, 80);
  circle(1850, 675, 80);
  if (traffic == 0) {
    fill(255, 0, 0);
    circle(1650, 675, 70);
  } else if (traffic == 1) {
    fill(0, 255, 0);
    circle(1850, 675, 70);
  } else if (traffic == 2) {
    fill(255, 255, 0);
    circle(1750, 675, 70);
  }
  //ボール
  if (scene != 4) {
    if (ballPos <= 1520) {
      drawSign();
      drawBall();
    } else {
      drawBall();
      drawSign();
    }
  }else{
    drawSign();
  }
}
void changeTraffic() {
  if (traffic == 2) {
    traffic = 0;
  } else {
    traffic++;
  }
}
void drawBall() {
  ballx = xPosition(ballPos);
  bally = yPosition(ballPos);
  fill(0, 0, 256);
  strokeWeight(5);
  circle(ballx, bally, 90);
}
void drawSign() {
  //停止線
  translate(1420, 440);
  int teishiX = 1370;
  int teishiY =590;
  fill(255);
  strokeWeight(0);
  rotate(radians(-32));
  rect(0, 0, 80, 10);
  rotate(radians(32));
  translate(-1420, -440);
  //停止看板
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(teishiX+45, teishiY, 10, -150);
  fill(#0066ab);
  stroke(255);
  strokeWeight(5);
  rect(teishiX, teishiY, 100, 100);
  fill(255);
  rect(teishiX+10, teishiY+60, 80, 20);
  textSize(27);
  scale(1, -1);
  text("停止線", teishiX+10, -(teishiY+20));
  fill(255);
  scale(1, -1);
}
