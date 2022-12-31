// by Frederik Holfeld

void setup() {
  size(1024, 1024);
  fill(0, 0, 0);
  textAlign(CENTER);
  textSize(42);
}

float rot = 0;

void draw() {
  background(255);
  translate(width / 2, height / 2);
  rotate(rot / 2048);
  text("Mir ist schon ganz schwindelig", 0, 0);
  rot = rot + mouseX + 8;
}
