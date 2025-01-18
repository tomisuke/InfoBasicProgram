// キー入力
void mousePressed() {
  switch(mouseButton) {
  case LEFT:
    scene = 1;
    Ani.to(self, 1, "ballPos", 150);
    println("ani");
    break;
  case RIGHT:
    lock();
    break;
  case CENTER:
    unlock();
    break;
  }
}
void keyPressed() {
  switch(key) {
  case 'e':
    unlock();
    break;
  case 'i':
    lock();
    break;
  case 'a':
    accel();
    break;
  case '1':
    scene = 1;
    Ani.to(self, 1, "ballPos", 150);
    println("ani");
    break;
  default:
    break;
  }
}
void unlock() {
  int unlock = 20;
  sendServo(1, unlock);
  sendServo(2, unlock);
}
void lock() {
  int lock = 125;
  sendServo(1, lock);
  sendServo(2, lock);
}
// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port1.readBytes();
  if (firstContact == false) {
    if (inByte[0] == 'C') { // Arduinoとの接続確認
      port1.clear();
      firstContact = true;
      unlock();
    }
  }
  // シリアルポートからデータを受け取ったら
  if (port2.available() >= 1) {
    String data = port2.readStringUntil('\n');
    if (data == null) {
      return;
    }
    data = data.trim();
    if (int(data) == 1) {
      println(1);
      accel();
    }
  }
}
// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value)
{
  if (!firstContact) return;
  int v = value;
  if (v < 15) v = 15; // サーボの最小値。個体差による。
  if (v > 125) v = 125; // サーボの最大値。個体差による。
  port1.write((byte)'S');
  port1.write((byte)id);
  port1.write((byte)v);
}
