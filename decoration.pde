void decoration() {
  seicoMart();
  for (int i = 0; i<10; i++) {
    wood(1000-100*i, 1000+50*i);
  }
}
void seicoMart() {
  PImage seicoMart;
  seicoMart = loadImage("seicoMart.png");
  translate(1650, 880);
  scale(-0.9, -0.9);
  rotate(radians(-12));
  image(seicoMart, 0, 0);
  rotate(radians(12));
  scale(-1/0.9, -1/0.9);
  translate(-1650, -880);
}
void wood(float x, float y) {
  strokeWeight(0);
  fill(0, 256, 0);
  triangle(x, y, x-80, y-100, x+80, y-100);
  fill(#98514B);
  rect(x-20, y-200, 40, 100);
}
