import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer SE;
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import processing.serial.*;


Serial port1; // Arduinoにデータを送るシリアルポート
Serial port2;
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する

byte[] inByte = new byte[3]; // 受信データ用バッファ

int scene = 4;
int oval1, oval2;
int ballx = 0;
int bally = 0;
int ballPos = 0;
int traffic = 0;
int fragTraffic = 0;
int fragBall = 0;
i

boolean serial = true;//サーボ無効の場合false
boolean m5 = true;//m5stack無効の場合false
PImage patocar;

PApplet self;
void setup() {
  PFont font = createFont("Meiryo", 50);
  minim = new Minim(this);
  patocar = loadImage("patocar.png");
  textFont(font);
  size(1920, 1200);
  if (serial) {
    println(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
    String portName = Serial.list()[0]; // 使用するシリアルポート名
    port1 = new Serial(this, portName, 9600);
    port1.buffer(inByte.length); // 読み込むバッファの長さをの指定
  }
  if (m5) {
    port2 =new Serial(this, "COM9", 4800);
  }
  Ani.init(this);
  self = this;
}

void draw() {
  switch(scene) {
  case 0:
    break;
  case 1:
    gameDraw();
    break;
  case 2:
    gameOverDraw();
    break;
  case 3:
    pause(1000, status);
    break;
  case 4:
    gameDraw();
    break;
  }
}
