// by Frederik Holfeld

// In diesem Sketch werden Hardware-Statistiken visualisiert,
// die vom MangoHud während dem Spielen von Computerspielen
// aufgezeichnet werden. Die CSV-Datei enthält in der ersten
// Spalte die Framerate, in der zweiten die Prozessorauslastung,
// in der vierten die Grafikkarten-Auslastung und die fünfte zeigt
// (vermutlich) die Zeit seit dem Start der Benchmark.

float barWidth = 1;
int marginX = 50;
int marginY = 50;

void setup() {

  Table data = loadTable("mangohud_log_2020-08-01_01-43-47", "csv");

  // Die ersten beiden Zeilen der Datei sind immer der Header und
  // Systeminformationen, daher - 2.
  int length = data.getRowCount() - 2;
  println("Anzahl der Datenpunkte: " + length);

  size(1280, 720);
  noStroke();
  colorMode(HSB, length);
  background(0, 0, length);

  for (int i = 2; i < data.getRowCount(); i++) {

    fill(i, length, length);

    rect(barWidth * (i - 2) + marginX, height - marginY, barWidth, data.getInt(i, 0) * -1);
    rect(barWidth * (i - 2) + marginX, height - marginY - 200, barWidth, data.getInt(i, 1) * -1);
    rect(barWidth * (i - 2) + marginX, height - marginY - 400, barWidth, data.getInt(i, 2) * -1);
  }
}

void draw() {

}
