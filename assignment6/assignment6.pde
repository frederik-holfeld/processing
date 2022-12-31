// by Frederik Holfeld

// In diesem Sketch werden Hardware-Statistiken visualisiert,
// die vom MangoHud während dem Spielen von Computerspielen
// aufgezeichnet werden. Die CSV-Datei enthält in der ersten
// Spalte die Framerate, in der zweiten die Prozessor-Auslastung,
// in der dritten die Grafikkarten-Auslastung und die vierte zeigt
// die Zeit seit dem Start der Benchmark, die letzte Zahl ist also
// die Dauer der Benchmark.


// Der Sketch sollte soweit flexibel genug sein, um so ziemlich jede von
// MangoHud generierte CSV-Datei darzustellen, in der die Daten gleich
// strukturiert sind, wie in dieser. Das einzige Problem können
// Daten mit sehr hohen Framerates sein, da diese nicht in das
// vorgesehene Platzbudget passen könnten. Da die Prozessor-Auslastung
// und Grafikkarten-Auslastung prozentual sind, können sie einen Maximal-
// Wert von 100 einnehmen und weisen demnach dieses Problem nicht auf.


float barWidth = 3;
float marginX, marginY;

int length;
Table data;

String os, cpu, kernel, driver;
int time;

void setup() {

  data = loadTable("mangohud_log_2020-08-01_01-43-47", "csv");

  os = data.getString(1,0);
  cpu = data.getString(1,1);
  kernel = data.getString(1,4);
  driver = data.getString(1,5);
  time = data.getInt(data.getRowCount() - 1, 3) / 1000000;

  data.removeRow(0);
  data.removeRow(0);

  length = data.getRowCount();
  println("Anzahl der Datenpunkte: " + length);

  size(1280, 720);
  noStroke();
  colorMode(HSB, length);
  background(0, 0, length);
  textSize(24);
  textAlign(CENTER);


  marginX = (width - length) / 2;
  marginY = marginX;
}


void draw() {

  clear();
  background(0, 0, length);

  fill(0);
  text("CPU (vorne) und GPU (hinten) in Prozent", width / 2, 650);
  text("Framerate in FPS", width / 2, 400);

  text(os + " | " + cpu + " | " + kernel + " | " + driver, width / 2, 100);
  text("Die Benchmark dauerte " + time + " Sekunden", width / 2, 150);

  translate(marginX, -marginY);

  for (int i = 0; i < data.getRowCount(); i++) {

    fill(i, length, data.getInt(i, 2) * 8);
    rect(barWidth * i, height,       barWidth, data.getInt(i, 2) * -1);

    fill(i, length, data.getInt(i, 1) * 8);
    rect(barWidth * i, height,       barWidth, data.getInt(i, 1) * -1);

    fill(i, length, data.getInt(i, 0) * 8);
    rect(barWidth * i, height - 250, barWidth, data.getInt(i, 0) * -1);

  }
  marginX = marginX + (mouseX - width / 2) / 100;
}
