// by Frederik Holfeld

size(1000, 700);
background(143, 197, 230);


stroke(0, 0, 0, 0);
for (int i = 1; i <= 4; i++) {
  fill(222, 198, 0, 64 * i - 1);
  ellipse(690, 20, 200 / i, 200 / i);
}

stroke(90, 150, 107);
fill(90, 150, 107);
triangle(0, 200, 250, 250, 0, 700);
triangle(250, 250, 600, 200, 0, 700);
triangle(600, 200, 750, 250, 0, 700);
triangle(750, 250, 1000, 225, 0, 700);
triangle(1000, 700, 1000, 225, 0, 700);

stroke(0, 0, 0, 0);
fill(165, 184, 192);
triangle(0, 200, 250, 250, 150, 150);
triangle(250, 250, 600, 200, 400, 50);
triangle(600, 200, 750, 250, 675, 150);
triangle(750, 250, 1000, 225, 850, 150);

fill(142, 154, 158);
triangle(100, 300, 400, 325, 250, 100);

int[] trees = {500, 250};
for (int i = 0; i < trees.length; i = i + 2) {
  for (int j = 1; j <= 1000; j++) {
    float posX = trees[i] + random(-500, 500);
    float posY = trees[i + 1] + j / 2.2;
    float size = random(8, 16);

    fill(121 + random(-10, 10), 84 + random(-10, 10), 32 + random(-10, 10));
    rect(posX + size / 3, posY, size / 3, size);

    fill(25 + random(-10, 10), 122 + random(-10, 10), 40 + random(-10, 10));
    float treeType = random(10);
    if (treeType <= 3) {
      for (int k = 0; k < random(100, 200); k++) {
        float crownSize = random(size / 8, size / 4);
        ellipse(posX + random(-10, 10) + size / 2, posY + random(-10, 10) - size / 2, crownSize, crownSize);
      }
    } else {
      for (int k = 0; k < random(4,6); k++) {
        triangle(posX, posY - 4 * k, posX + size, posY - 4 * k, posX + size / 2, posY - size - 4 * k);
      }
    }
  }
}

int[] clouds = {300, 150, 500, 150, 650, 225, 100, 200, 0, 225};
for (int i = 0; i < clouds.length; i = i + 2) {
  for (int j = 0; j <= random(50, 100); j++) {
    fill(221, 228, 229, random(10, 30));
    ellipse(clouds[i] + 5 * j, clouds[i + 1] + random(-25, 25), random(50, 100), random(50, 100));
  }
}
