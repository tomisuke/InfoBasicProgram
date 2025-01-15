#include "BluetoothSerial.h"
#include "M5StickCPlus2.h"
BluetoothSerial SerialBT;

// put function declarations here:
int myFunction(int, int);

void setup() {
  auto cfg = M5.config();
  StickCP2.begin(cfg);
  Serial.begin(9600);
  SerialBT.begin("TomisukeM5");
  pinMode(19, OUTPUT);
}

void loop() {
  M5.update();
  if (M5.BtnA.isPressed()) {
    SerialBT.println("2");
    while (M5.BtnA.isPressed()) {
      M5.update();
    }
  }
}

// put function definitions here:
int myFunction(int x, int y) { return x + y; }