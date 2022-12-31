// by Frederik Holfeld

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  noFill();
  stroke(100, 50);
  strokeWeight(4);
}

// Der append-Befehl funktioniert leider nicht mit 2-dimensionalen Arrays (laut der Processing-Referenz), deshalb habe ich einfach 3 Arrays gemacht. ¯\_(0.0)_/¯
float[] posX = new float[0];
float[] posY = new float[0];
float[] size = new float[0];
float[] threshold = new float[0];
int count = 0;

void draw() {
  background(#00008b);
  for (int i = 0; i < count; i++) {
    if (size[i] <= threshold[i]) {
      ellipse(posX[i], posY[i], size[i], size[i]);
      size[i] = size[i] + 0.5;
    }
  }
}

void mousePressed() {
  posX = append(posX, mouseX);
  posY = append(posY, mouseY);
  size = append(size, 0);
  threshold = append(threshold, random(50, 400));
  count++;
  println(count);
}
