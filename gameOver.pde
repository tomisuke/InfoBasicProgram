void gameOverDraw() {
  background(0);
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("GameOver", width/2, height/2);
  textAlign(LEFT, TOP);
}
void pause(int pauseTime, int status) {
  if (millis() - flagPause >= pauseTime) {
    if (status == 0) {//ゲームオーバー
      scene = 2;
    } else if (status == 1) {//ゲームクリア
      scene = 4;
    }
  }
}
