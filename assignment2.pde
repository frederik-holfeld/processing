// by Frederik Holfeld

void setup() {
  size(500, 400);
  colorMode(HSB, 500, 400, 100);
}

float[] circlePosX = new float[0];
float[] circlePosY = new float[0];
float[] rectPosX = new float[0];
float[] rectPosY = new float[0];

void draw() {
  background(mouseX, mouseY, 100);
  for (int i = 0; i < circlePosX.length; i++) {
    ellipse(circlePosX[i], circlePosY[i], 50, 50);
  }
  for (int i = 0; i < rectPosX.length; i++) {
    rect(rectPosX[i] - 25, rectPosY[i] - 25, 50, 50);
  }
}

void mousePressed() {
  circlePosX = append(circlePosX, mouseX);
  circlePosY = append(circlePosY, mouseY);
}

void keyPressed() {
  rectPosX = append(rectPosX, mouseX);
  rectPosY = append(rectPosY, mouseY);
}
